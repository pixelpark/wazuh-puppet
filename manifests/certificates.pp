# Class: wazuh::certificates
class wazuh::certificates (
  Array[Array] $indexer_certs = [],
  Array[Array] $manager_certs = [],
  Array       $dashboard_certs = [],
  String      $base_cert_path = '/tmp/wazuh-certificates',
  String      $wazuh_version = '4.9',
) {

  include wazuh::params_manager

  # Extract major.minor version from full version
  $version_parts = split($wazuh::params_manager::server_package_version, '[.]')
  $short_version = "${version_parts[0]}.${version_parts[1]}"

  # Deploy config.yml for certificate generation
  file { '/tmp/config.yml':
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    content => template('wazuh/wazuh_config_yml.erb'),
  }

  # Download and run certificate generation script
  file { '/tmp/wazuh-certs-tool.sh':
    ensure => file,
    source => "https://packages.wazuh.com/${short_version}/wazuh-certs-tool.sh",
    owner  => 'root',
    group  => 'root',
    mode   => '0740',
  }

  # Clean up old certificates if they exist
  exec { 'Cleanup old Wazuh certificates':
    path    => '/usr/bin:/bin',
    command => "rm -rf ${base_cert_path}",
    onlyif  => "test -d ${base_cert_path}",
    before  => Exec['Create Wazuh Certificates'],
  }

  # Create certificates using the tool
  exec { 'Create Wazuh Certificates':
    path    => '/usr/bin:/bin',
    command => 'bash /tmp/wazuh-certs-tool.sh --all',
    creates => "${base_cert_path}/admin.pem",  # Use a specific file as creation flag
    require => [
      File['/tmp/wazuh-certs-tool.sh'],
      File['/tmp/config.yml'],
    ],
  }

  # Manage certificates after they're created
  wazuh::certificate { 'root-ca':
    cert_path => $base_cert_path,
    with_key  => false,
    require   => Exec['Create Wazuh Certificates'],
  }

  wazuh::certificate { 'admin':
    cert_path => $base_cert_path,
    require   => Exec['Create Wazuh Certificates'],
  }

  # Create indexer certificates
  $indexer_certs.each |$cert| {
    wazuh::certificate { "indexer-${cert[0]}":
      cert_path => $base_cert_path,
      require   => Exec['Create Wazuh Certificates'],
    }
  }

  # Create manager certificates
  $manager_certs.each |$cert| {
    wazuh::certificate { "manager-${cert[0]}":
      cert_path => $base_cert_path,
      require   => Exec['Create Wazuh Certificates'],
    }
  }

  # Create dashboard certificates
  $dashboard_certs.each |$ip| {
    wazuh::certificate { "dashboard-${ip}":
      cert_path => $base_cert_path,
      require   => Exec['Create Wazuh Certificates'],
    }
  }
}
