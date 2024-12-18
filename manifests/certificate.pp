# Define: wazuh::certificate
# Manages a single Wazuh certificate and its key
define wazuh::certificate (
  String  $cert_name     = $title,
  String  $cert_path     = '/tmp/wazuh-certificates',
  String  $target_path   = undef,
  String  $owner         = 'root',
  String  $group         = 'root',
  String  $cert_mode     = '0400',
  Boolean $with_key      = true,
) {
  # Validate certificate existence and set permissions
  file { "${cert_path}/${cert_name}.pem":
    ensure  => file,
    owner   => $owner,
    group   => $group,
    mode    => $cert_mode,
    replace => false,  # Don't replace existing certs
    require => Exec['Create Wazuh Certificates'],
  }

  # The key file (if requested)
  if $with_key {
    file { "${cert_path}/${cert_name}-key.pem":
      ensure  => file,
      owner   => $owner,
      group   => $group,
      mode    => $cert_mode,
      replace => false,  # Don't replace existing keys
      require => Exec['Create Wazuh Certificates'],
    }
  }

  # If target path is specified, create symlinks
  if $target_path {
    # Ensure target directory exists
    ensure_resource('file', $target_path, {
        'ensure' => 'directory',
        'owner'  => $owner,
        'group'  => $group,
        'mode'   => '0750',
    })

    file { "${target_path}/${cert_name}.pem":
      ensure  => link,
      target  => "${cert_path}/${cert_name}.pem",
      owner   => $owner,
      group   => $group,
      require => [
        File["${cert_path}/${cert_name}.pem"],
        File[$target_path],
      ],
    }

    if $with_key {
      file { "${target_path}/${cert_name}-key.pem":
        ensure  => link,
        target  => "${cert_path}/${cert_name}-key.pem",
        owner   => $owner,
        group   => $group,
        require => [
          File["${cert_path}/${cert_name}-key.pem"],
          File[$target_path],
        ],
      }
    }
  }
}
