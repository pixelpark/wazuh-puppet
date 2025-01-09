class wazuh::certificates (
  $wazuh_repository = 'packages.wazuh.com',
  $wazuh_version = '4.8',
  $indexer_certs = [],
  $manager_certs = [],
  $manager_master_certs = [],
  $manager_worker_certs = [],
  $dashboard_certs = [],
  # Add new parameter with a more appropriate default path
  $certificates_store_path = '/etc/wazuh/certs_store'
) {
  file { 'Configure Wazuh Certificates config.yml':
    owner   => 'root',
    path    => '/tmp/config.yml',
    group   => 'root',
    mode    => '0640',
    content => template('wazuh/wazuh_config_yml.erb'),
  }

  file { '/tmp/wazuh-certs-tool.sh':
    ensure => file,
    source => "https://${wazuh_repository}/${wazuh_version}/wazuh-certs-tool.sh",
    owner  => 'root',
    group  => 'root',
    mode   => '0740',
  }

  exec { 'Create Wazuh Certificates':
    path    => '/usr/bin:/bin',
    command => 'bash /tmp/wazuh-certs-tool.sh --all',
    creates => '/tmp/wazuh-certificates',
    require => [
      File['/tmp/wazuh-certs-tool.sh'],
      File['/tmp/config.yml'],
    ],
  }

  file { $certificates_store_path:
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

  file { 'Copy all certificates into store':
    ensure  => 'directory',
    source  => '/tmp/wazuh-certificates/',
    recurse => 'remote',
    path    => $certificates_store_path,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
  }
}
