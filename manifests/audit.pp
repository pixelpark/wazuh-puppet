# Copyright (C) 2015, Wazuh Inc.
# Define an ossec command
class wazuh::audit (
  $audit_manage_rules = false,
  $audit_buffer_bytes = '8192',
  $audit_backlog_wait_time = '0',
  $audit_rules = [],
  $audit_package_title = 'Installing Audit..',
  $service_notify = undef,
) {
  case $facts['kernel'] {
    'Linux': {
      case $facts['os']['name'] {
        'Debian', 'debian', 'Ubuntu', 'ubuntu': {
          package { $audit_package_title:
            name => 'auditd',
          }
        }
        default: {
          package { $audit_package_title:
            name => 'audit',
          }
        }
      }

      if $facts['os']['family'] == 'RedHat' and versioncmp($facts['os']['release']['major'], '8') < 0 {
        $audit_reload_command = '/sbin/service auditd reload'
      } else {
        $audit_reload_command = '/sbin/auditctl --signal reload'
      }

      service { 'auditd':
        ensure     => running,
        enable     => true,
        hasrestart => false,   # ensure that restart cmd is used
        restart    => $audit_reload_command,
        require    => Package[$audit_package_title],
        notify     => Service[$service_notify],
      }

      if $facts['os']['name'] in ['CentOS','RedHat'] and versioncmp($facts['os']['release']['major'], '8') >= 0 {
        # Workaround - splited audit package for audit plugins
        package { 'audispd-plugins':
          ensure  => 'present',
          require => Package[$audit_package_title],
        }
      }

      exec { 'Restore Wazuh whodata audit rules':
        command => $audit_reload_command,
        unless  => '/sbin/auditctl -l | /bin/grep -F -q wazuh_fim',
        require => Service['auditd'],
        notify  => Service[$service_notify],
      }

      if $audit_manage_rules == true {
        file { '/etc/audit/rules.d/audit.rules':
          ensure  => file,
          require => Service['auditd'],
        }

        $audit_rules.each |String $rule| {
          file_line { "Append rule ${rule} to /etc/audit/rules.d/audit.rules":
            path    => '/etc/audit/rules.d/audit.rules',
            line    => $rule,
            require => File['/etc/audit/rules.d/audit.rules'],
          }
        }
      }
    }
    default: {
      fail("Module Audit not supported on ${facts['os']['name']}")
    }
  }
}
