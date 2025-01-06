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
  # Component configuration hash
  $component_configs = {
    'indexer' => {
      'cert_prefix'     => 'indexer',
      'required_certs'  => ['root-ca', 'admin', $component_name],
      'source_mapping'  => {
        'root-ca' => 'root-ca',
        'admin'   => 'admin',
        $component_name => "indexer-${component_name}",
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
        $component_name => "manager-${component_name}",
      },
    },
  }

  $config = $component_configs[$component_type]
  $real_target_path = pick($target_path, $source_path)

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
    $source_name = $config['source_mapping'][$cert]
    @file { "${real_target_path}/${source_name}.pem":
      ensure    => file,
      owner     => $owner,
      group     => $group,
      mode      => $cert_mode,
      source    => "${source_path}/${source_name}.pem",
      show_diff => false,
      require   => Exec['Create Wazuh Certificates'],
      tag       => "${component_type}_certs",
    }
  }

  # Define virtual resources for key files (excluding root-ca)
  ($config['required_certs'] - ['root-ca']).each |$cert| {
    $source_name = $config['source_mapping'][$cert]
    @file { "${real_target_path}/${source_name}-key.pem":
      ensure    => file,
      owner     => $owner,
      group     => $group,
      mode      => $cert_mode,
      source    => "${source_path}/${source_name}-key.pem",
      show_diff => false,
      require   => Exec['Create Wazuh Certificates'],
      tag       => "${component_type}_certs",
    }
  }

  # Realize all virtual resources
  File <| tag == "${component_type}_certs" |>
}
