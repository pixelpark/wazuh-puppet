# Define: wazuh::cert_manager
define wazuh::cert_manager (
  String                         $component_name  = $title,
  Enum['indexer', 'dashboard', 'manager'] $component_type,
  String                         $source_path     = '/tmp/wazuh-certificates',
  Optional[String]               $target_path     = undef,
  String                         $owner           = 'root',
  String                         $group           = 'root',
  String                         $cert_mode       = '0400',
  Hash                          $cert_data        = {},
) {
  $real_target_path = pick($target_path, $source_path)

  # Construct certificate paths based on component type
  case $component_type {
    'indexer': {
      $cert_prefix = 'indexer'
      $required_certs = ['root-ca', 'admin', $component_name]
      $source_name = $component_name
    }
    'dashboard': {
      $cert_prefix = 'dashboard'
      $required_certs = ['root-ca', $cert_prefix]
      $source_name = $cert_prefix
    }
    'manager': {
      $cert_prefix = 'manager'
      $required_certs = ['root-ca', $component_name]
      $source_name = "${cert_prefix}-${component_name}"
    }
    default: {
      fail("Unsupported component type: ${component_type}")
    }
  }

  # Ensure target directory exists if different from source
  if $real_target_path != $source_path {
    ensure_resource('file', $real_target_path, {
        'ensure' => 'directory',
        'owner'  => $owner,
        'group'  => $group,
        'mode'   => '0750',
    })
  }

  # Create links for required certificates
  $required_certs.each |String $cert| {
    # Skip if cert is already managed by another resource
    unless defined(File["${real_target_path}/${cert}.pem"]) {
      if $cert != 'root-ca' and $cert == $component_name {
        # Use prefixed name for source when it's a component cert
        $real_source_name = $source_name
      } else {
        # Use cert name directly for root-ca and other certs
        $real_source_name = $cert
      }

      file { "${real_target_path}/${cert}.pem":
        ensure    => file,
        owner     => $owner,
        group     => $group,
        mode      => $cert_mode,
        source    => "${source_path}/${real_source_name}.pem",
        show_diff => false,
        require   => Exec['Create Wazuh Certificates'],
      }

      # Handle key files (except for root-ca)
      if $cert != 'root-ca' {
        file { "${real_target_path}/${cert}-key.pem":
          ensure    => file,
          owner     => $owner,
          group     => $group,
          mode      => $cert_mode,
          source    => "${source_path}/${real_source_name}-key.pem",
          show_diff => false,
          require   => Exec['Create Wazuh Certificates'],
        }
      }
    }
  }
}
