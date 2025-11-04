# Define: wazuh::cert_manager
# Manages certificate creation and deployment for Wazuh components
define wazuh::cert_manager (
  String                                  $component_name  = $title,
  Enum['indexer', 'dashboard', 'manager'] $component_type,
  String                                  $source_path     = '/tmp/wazuh-certificates',
  Optional[String]                        $target_path     = undef,
  String                                  $owner           = 'root',
  String                                  $group           = 'root',
  String                                  $cert_mode       = '0400',
  Hash                                    $cert_data        = {},
) {
  # Component configuration hash
  $component_configs = {
    'indexer' => {
      'cert_prefix'     => 'indexer',
      'required_certs'  => ['root-ca', 'admin', $component_name],
      'source_mapping'  => {
        'root-ca' => 'root-ca',
        'admin'   => 'admin',
        $component_name => $component_name,
      },
    },
    'dashboard' => {
      'cert_prefix'     => 'dashboard',
      'required_certs'  => ['root-ca', 'dashboard'],
      'source_mapping'  => {
        'root-ca'   => 'root-ca',
        'dashboard' => 'dashboard',
      },
    },
    'manager' => {
      'cert_prefix'     => 'manager',
      'required_certs'  => ['root-ca', $component_name],
      'source_mapping'  => {
        'root-ca'      => 'root-ca',
        $component_name => $component_name,
      },
    },
  }

  # Get configuration for current component type
  $config = $component_configs[$component_type]
  $real_target_path = pick($target_path, $source_path)

  # Create target directory if needed
  if $real_target_path != $source_path {
    ensure_resource('file', $real_target_path, {
        'ensure' => 'directory',
        'owner'  => $owner,
        'group'  => $group,
        'mode'   => '0750',
    })
  }

  # Define virtual resources for certificates
  $config['required_certs'].each |$cert| {
    @file { "${real_target_path}/${cert}.pem":
      ensure    => file,
      owner     => $owner,
      group     => $group,
      mode      => $cert_mode,
      source    => "${source_path}/${config['source_mapping'][$cert]}.pem",
      show_diff => false,
      require   => Exec['Create Wazuh Certificates'],
      tag       => "${component_type}_certs",
    }
  }

  # Define virtual resources for key files (excluding root-ca)
  ($config['required_certs'] - ['root-ca']).each |$cert| {
    @file { "${real_target_path}/${cert}-key.pem":
      ensure    => file,
      owner     => $owner,
      group     => $group,
      mode      => $cert_mode,
      source    => "${source_path}/${config['source_mapping'][$cert]}-key.pem",
      show_diff => false,
      require   => Exec['Create Wazuh Certificates'],
      tag       => "${component_type}_certs",
    }
  }

  # Realize all virtual resources for this component type
  File <| tag == "${component_type}_certs" |>
}
