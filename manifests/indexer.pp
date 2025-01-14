# @summary Setup for Wazuh Indexer
#
# This class manages the installation and configuration of the Wazuh indexer component
#
# @param indexer_network_host 
#   Specifies which network interface the indexer binds to
#   Default: '0.0.0.0'
#
# @param indexer_cluster_name 
#   Name of the indexer cluster
#   Default: 'wazuh-cluster'
#
# @param indexer_node_name 
#   Unique name for this node in the cluster
#   Default: 'node-1'
#
# @param indexer_node_max_local_storage_nodes 
#   Maximum number of nodes that can be started on this machine
#   Default: '1'
#
# @param indexer_service 
#   Name of the indexer service
#   Default: 'wazuh-indexer'
#
# @param indexer_package 
#   Name of the indexer package to install
#   Default: 'wazuh-indexer'
#
# @param indexer_version 
#   Version of the indexer to install
#   Default: '4.9.2'
#
# @param indexer_fileuser 
#   Owner of indexer files
#   Default: 'wazuh-indexer'
#
# @param indexer_filegroup 
#   Group owner of indexer files
#   Default: 'wazuh-indexer'
#
# @param indexer_path_data 
#   Path where indexer stores its data
#   Default: '/var/lib/wazuh-indexer'
#
# @param indexer_path_logs 
#   Path where indexer stores its logs 
#   Default: '/var/log/wazuh-indexer'
#
# @param indexer_path_certs 
#   Path where certificates are stored
#   Default: '/etc/wazuh-indexer/certs'
#
# @param indexer_security_init_lockfile 
#   Path to security initialization lockfile
#   Default: '/var/tmp/indexer-security-init.lock'
#
# @param full_indexer_reinstall 
#   Whether to perform a full reinstall of the indexer
#   Default: false
#
# @param indexer_ip 
#   IP address of the indexer
#   Default: 'localhost'
#
# @param indexer_port 
#   Port number the indexer listens on
#   Default: '9200'
#
# @param indexer_discovery_hosts 
#   List of hosts for cluster discovery
#   Default: []
#
# @param indexer_cluster_initial_master_nodes 
#   List of initial master nodes in the cluster
#   Default: ['node-1']
#
# @param indexer_cluster_cn 
#   Common Names for the cluster nodes
#   Default: ['node-1']
#
# @param jvm_options_memory 
#   Amount of memory to allocate to the JVM
#   Default: '1g'
class wazuh::indexer (
  String  $indexer_network_host                    = '0.0.0.0',
  String  $indexer_cluster_name                    = 'wazuh-cluster',
  String  $indexer_node_name                       = 'node-1',
  String  $indexer_node_max_local_storage_nodes    = '1',
  String  $indexer_service                         = 'wazuh-indexer',
  String  $indexer_package                         = 'wazuh-indexer',
  String  $indexer_version                         = '4.9.2',
  String  $indexer_fileuser                        = 'wazuh-indexer',
  String  $indexer_filegroup                       = 'wazuh-indexer',
  String  $indexer_path_data                       = '/var/lib/wazuh-indexer',
  String  $indexer_path_logs                       = '/var/log/wazuh-indexer',
  String  $indexer_path_certs                      = '/etc/wazuh-indexer/certs',
  String  $indexer_security_init_lockfile          = '/var/tmp/indexer-security-init.lock',
  Boolean $full_indexer_reinstall                  = false,
  String  $indexer_ip                              = 'localhost',
  String  $indexer_port                            = '9200',
  Array[String] $indexer_discovery_hosts           = [],
  Array[String] $indexer_cluster_initial_master_nodes = ['node-1'],
  Array[String] $indexer_cluster_cn                = ['node-1'],
  Pattern[/^\d+[kmgt]$/] $jvm_options_memory       = '1g',
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
  package { 'wazuh-indexer':
    ensure => $indexer_version_install,
    name   => $indexer_package,
  }

  wazuh::cert_manager { $indexer_node_name:
    component_type => 'indexer',
    target_path    => $indexer_path_certs,
    owner          => $indexer_fileuser,
    group          => $indexer_filegroup,
    require        => Package['wazuh-indexer'],
  }

  file { 'configuration file':
    path    => '/etc/wazuh-indexer/opensearch.yml',
    content => template('wazuh/wazuh_indexer_yml.erb'),
    group   => $indexer_filegroup,
    mode    => '0660',
    owner   => $indexer_fileuser,
    require => [
      Package['wazuh-indexer'],
      Wazuh::Cert_manager[$indexer_node_name],
    ],
    notify  => Service['wazuh-indexer'],
  }

  file_line { 'Insert line initial size of total heap space':
    path    => '/etc/wazuh-indexer/jvm.options',
    line    => "-Xms${jvm_options_memory}",
    match   => '^-Xms',
    require => Package['wazuh-indexer'],
    notify  => Service['wazuh-indexer'],
  }

  file_line { 'Insert line maximum size of total heap space':
    path    => '/etc/wazuh-indexer/jvm.options',
    line    => "-Xmx${jvm_options_memory}",
    match   => '^-Xmx',
    require => Package['wazuh-indexer'],
    notify  => Service['wazuh-indexer'],
  }

  service { 'wazuh-indexer':
    ensure    => running,
    enable    => true,
    name      => $indexer_service,
    require   => [
      Package['wazuh-indexer'],
      Wazuh::Cert_manager[$indexer_node_name],
      File['configuration file'],
    ],
    subscribe => [
      Wazuh::Cert_manager[$indexer_node_name],
      File['configuration file'],
    ],
  }

  file_line { "Insert line limits nofile for ${indexer_fileuser}":
    path   => '/etc/security/limits.conf',
    line   => "${indexer_fileuser} - nofile  65535",
    match  => "^${indexer_fileuser} - nofile\s",
    notify => Service['wazuh-indexer'],
  }
  file_line { "Insert line limits memlock for ${indexer_fileuser}":
    path   => '/etc/security/limits.conf',
    line   => "${indexer_fileuser} - memlock unlimited",
    match  => "^${indexer_fileuser} - memlock\s",
    notify => Service['wazuh-indexer'],
  }

  # TODO: this should be done by the package itself and not by puppet at all
  [
    '/etc/wazuh-indexer',
    '/usr/share/wazuh-indexer',
    '/var/lib/wazuh-indexer',
  ].each |String $file| {
    exec { "set recusive ownership of ${file}":
      path        => '/usr/bin:/bin',
      command     => "chown ${indexer_fileuser}:${indexer_filegroup} -R ${file}",
      refreshonly => true,  # only run when package is installed or updated
      subscribe   => Package['wazuh-indexer'],
      before      => Service['wazuh-indexer'],
      require     => Wazuh::Cert_manager[$indexer_node_name],
    }
  }

  if $full_indexer_reinstall {
    file { $indexer_security_init_lockfile:
      ensure  => absent,
      require => Package['wazuh-indexer'],
      before  => Exec['Initialize the Opensearch security index in Wazuh indexer'],
    }
  }
}
