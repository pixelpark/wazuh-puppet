# Class: wazuh::certificates
class wazuh::certificates (
  Array[Array] $indexer_certs = [],
  Array[Array] $manager_certs = [],
  Array       $dashboard_certs = [],
  String      $base_cert_path = '/tmp/wazuh-certificates',
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

  # Create certificates using the tool
  exec { 'Create Wazuh Certificates':
    path    => '/usr/bin:/bin',
    command => 'bash /tmp/wazuh-certs-tool.sh --all',
    creates => "${base_cert_path}/admin.pem",
    require => [
      File['/tmp/wazuh-certs-tool.sh'],
      File['/tmp/config.yml'],
    ],
  }
}
