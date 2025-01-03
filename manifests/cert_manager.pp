# Define: wazuh::cert_manager
# Manages certificate creation and deployment for Wazuh components
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
  # Validate component specific parameters
  $real_target_path = pick($target_path, $source_path)

  # Construct certificate paths based on component type
  case $component_type {
    'indexer': {
      $cert_prefix = 'indexer'
      $required_certs = ['root-ca', 'admin', "${cert_prefix}-${component_name}"]
    }
    'dashboard': {
      $cert_prefix = 'dashboard'
      $required_certs = ['root-ca', $cert_prefix]
    }
    'manager': {
      $cert_prefix = 'manager'
      $required_certs = ['root-ca', "${cert_prefix}-${component_name}"]
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
      file { "${real_target_path}/${cert}.pem":
        ensure    => file,
        owner     => $owner,
        group     => $group,
        mode      => $cert_mode,
        source    => "${source_path}/${cert}.pem",
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
          source    => "${source_path}/${cert}-key.pem",
          show_diff => false,
          require   => Exec['Create Wazuh Certificates'],
        }
      }
    }
  }
}
