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

      service { 'auditd':
        ensure     => running,
        enable     => true,
        hasrestart => false,   # ensure that restart cmd is used
        restart    => '/bin/systemctl kill auditd.service; /bin/systemctl start auditd.service',
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
      if $facts['os']['name'] in ['CentOS','RedHat'] and versioncmp($facts['os']['release']['major'], '9') >= 0 {
        # Workaround - wazuh-agent / wazuh-manager use hardlinking on service startup
        # which breaks on multi layer OS disk layouts. [Invalid cross-device link]
        # Note source will created on first startup so first service start will fail 😮‍💨
        exec { "let ${service_notify} generate af_wazuh.conf":
          command => [
            '/bin/systemctl',
            'start',
            "${service_notify}.service",
          ],
          unless  => [[
              '/bin/test',
              '-f',
              '/var/ossec/etc/af_wazuh.conf',
          ]],
        }
        -> file { '/etc/audit/plugins.d/af_wazuh.conf':
          ensure  => file,
          owner   => 'root',
          group   => 'root',
          mode    => '0640',
          source  => '/var/ossec/etc/af_wazuh.conf',
          require => Package['audispd-plugins'],
          notify  => Service['auditd'],
        }
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
