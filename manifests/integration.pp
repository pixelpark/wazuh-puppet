# Copyright (C) 2015, Wazuh Inc.
#Define for a specific ossec integration
define wazuh::integration (
  $hook_url = '',
  $api_key = '',
  $in_rule_id = '',
  $in_level = 7,
  $in_group = '',
  $in_location = '',
  $in_format = '',
  $in_max_log = '',
  $in_options = '',
  $script_source = '',
) {
  require wazuh::params_manager

  # Hiera-friendly inputs: the rule-ID allowlist may arrive as an array and
  # the script options as a hash; ossec.conf wants a CSV string and JSON.
  $_in_rule_id = $in_rule_id ? {
    Array   => join($in_rule_id, ','),
    default => $in_rule_id,
  }

  concat::fragment { $name:
    target  => 'manager_ossec.conf',
    order   => 60,
    content => template('wazuh/fragments/_integration.erb'),
  }

  if $script_source != '' {
    file { "/var/ossec/integrations/${name}":
      ensure  => file,
      owner   => 'root',
      group   => 'wazuh',
      mode    => '0750',
      source  => $script_source,
      require => Package[$wazuh::params_manager::server_package],
    }
  }
}
