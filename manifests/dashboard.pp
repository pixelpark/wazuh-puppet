# Copyright (C) 2015, Wazuh Inc.
# Setup for Wazuh Dashboard
class wazuh::dashboard (
  $dashboard_package = 'wazuh-dashboard',
  $dashboard_service = 'wazuh-dashboard',
  $dashboard_version = '4.9.2',
  $indexer_server_ip = 'localhost',
  $indexer_server_port = '9200',
  $manager_api_host = '127.0.0.1',
  $dashboard_path_certs = '/etc/wazuh-dashboard/certs',
  $dashboard_fileuser = 'wazuh-dashboard',
  $dashboard_filegroup = 'wazuh-dashboard',

  $dashboard_server_port = '443',
  $dashboard_server_host = '0.0.0.0',
  $dashboard_server_hosts = "https://${indexer_server_ip}:${indexer_server_port}",

  # If the keystore is used, the credentials are not managed by the module (TODO).
  # If use_keystore is false, the keystore is deleted, the dashboard use the credentials in the configuration file.
  $use_keystore = true,
  $dashboard_user = 'kibanaserver',
  $dashboard_password = 'kibanaserver',

  $dashboard_wazuh_api_credentials = [
    {
      'id'       => 'default',
      'url'      => "https://${manager_api_host}",
      'port'     => '55000',
      'user'     => 'wazuh-wui',
      'password' => 'wazuh-wui',
    },
  ],

) {
  # assign version according to the package manager
  case $facts['os']['family'] {
    'Debian': {
      $indexer_version_install = "${indexer_version}-*"
    }
    'RedHat': {
      # Include full VERSION-RELEASE format for RedHat family
      $indexer_version_install = "${indexer_version}-1"
    }
    default: {
      $indexer_version_install = $indexer_version
    }
  }

  # install package
  package { 'wazuh-dashboard':
    ensure => $dashboard_version_install,
    name   => $dashboard_package,
  }

  wazuh::cert_manager { 'dashboard':
    component_type => 'dashboard',
    target_path    => $dashboard_path_certs,
    owner          => $dashboard_fileuser,
    group          => $dashboard_filegroup,
    require        => Package['wazuh-dashboard'],
  }

  file { '/etc/wazuh-dashboard/opensearch_dashboards.yml':
    content => template('wazuh/wazuh_dashboard_yml.erb'),
    group   => $dashboard_filegroup,
    mode    => '0640',
    owner   => $dashboard_fileuser,
    require => Package['wazuh-dashboard'],
    notify  => Service['wazuh-dashboard'],
  }

  file { ['/usr/share/wazuh-dashboard/data/wazuh/', '/usr/share/wazuh-dashboard/data/wazuh/config']:
    ensure  => 'directory',
    group   => $dashboard_filegroup,
    mode    => '0755',
    owner   => $dashboard_fileuser,
    require => Package['wazuh-dashboard'],
  }
  -> file { '/usr/share/wazuh-dashboard/data/wazuh/config/wazuh.yml':
    content => template('wazuh/wazuh_yml.erb'),
    group   => $dashboard_filegroup,
    mode    => '0600',
    owner   => $dashboard_fileuser,
    notify  => Service['wazuh-dashboard'],
  }

  unless $use_keystore {
    file { '/etc/wazuh-dashboard/opensearch_dashboards.keystore':
      ensure  => absent,
      require => Package['wazuh-dashboard'],
      before  => Service['wazuh-dashboard'],
    }
  }

  service { 'wazuh-dashboard':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    name       => $dashboard_service,
  }
}
