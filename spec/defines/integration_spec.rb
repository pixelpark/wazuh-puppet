require 'spec_helper'

describe 'wazuh::integration' do
  on_supported_os(
    supported_os: [{ 'operatingsystem' => 'RedHat', 'operatingsystemrelease' => ['9'] }],
  ).each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts.merge(concat_basedir: '/dummy') }
      let(:pre_condition) do
        <<-PP
          package { 'wazuh-manager': ensure => installed }
          concat { 'manager_ossec.conf': path => '/var/ossec/etc/ossec.conf' }
        PP
      end

      context 'declared like the custom-jira alarm integration' do
        let(:title) { 'custom-jira' }
        let(:params) do
          {
            hook_url: 'https://jira.example.com',
            api_key: 'user:p&<secret',
            in_rule_id: %w[100001 100002 100003],
            in_level: '',
            in_format: 'json',
            in_options: { 'project' => 'SPKSUP & <Ops>' },
            script_source: 'puppet:///modules/wazuh/integrations/custom-jira',
          }
        end

        it { is_expected.to compile.with_all_deps }
        it {
          is_expected.to contain_concat__fragment('custom-jira')
            .with_target('manager_ossec.conf')
            .with_content(%r{<name>custom-jira</name>})
            .with_content(%r{<hook_url>https://jira\.example\.com</hook_url>})
            .with_content(%r{<api_key>user:p&amp;&lt;secret</api_key>})
            .with_content(%r{<rule_id>100001,100002,100003</rule_id>})
            .with_content(%r{<alert_format>json</alert_format>})
            .with_content(%r{<options>\{&quot;project&quot;:&quot;SPKSUP &amp; &lt;Ops&gt;&quot;\}</options>})
        }
        it 'renders no level filter so rule_id is the only criterion' do
          is_expected.to contain_concat__fragment('custom-jira').without_content(%r{<level>})
        end
        it {
          is_expected.to contain_file('/var/ossec/integrations/custom-jira')
            .with_ensure('file')
            .with_owner('root')
            .with_group('wazuh')
            .with_mode('0750')
            .with_source('puppet:///modules/wazuh/integrations/custom-jira')
            .that_requires('Package[wazuh-manager]')
        }
      end

      context 'declared with legacy string parameters (pre-existing behavior)' do
        let(:title) { 'custom-legacy' }
        let(:params) do
          {
            in_rule_id: '1002,1003',
            in_options: '{"raw": "json string"}',
          }
        end

        it { is_expected.to compile.with_all_deps }
        it {
          is_expected.to contain_concat__fragment('custom-legacy')
            .with_content(%r{<rule_id>1002,1003</rule_id>})
            .with_content(%r{<options>\{&quot;raw&quot;: &quot;json string&quot;\}</options>})
        }
      end

      context 'declared with only a hook_url (pre-existing behavior)' do
        let(:title) { 'slack' }
        let(:params) { { hook_url: 'https://hooks.slack.com/services/T0/B0/XX' } }

        it { is_expected.to compile.with_all_deps }
        it {
          is_expected.to contain_concat__fragment('slack')
            .with_content(%r{<hook_url>https://hooks\.slack\.com/services/T0/B0/XX</hook_url>})
            .with_content(%r{<level>7</level>})
            .without_content(%r{<options>})
        }
        it 'deploys no script when script_source is unset' do
          is_expected.not_to contain_file('/var/ossec/integrations/slack')
        end
      end
    end
  end
end
