require 'spec_helper'
require 'json'

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

      # Wazuh's os_xml parser copies element content verbatim and decodes no
      # XML entities, so this slice is byte-for-byte what the integrator
      # writes to its /tmp/*.options file.
      def verbatim_options(title)
        content = catalogue.resource('Concat::Fragment', title)[:content]
        content[%r{<options>(.*?)</options>}m, 1]
      end

      context 'declared like the custom-jira alarm integration' do
        let(:title) { 'custom-jira' }
        let(:params) do
          {
            hook_url: 'https://jira.example.com/rest?x=1&y=2',
            api_key: 'svc-jira:Abc123.,_-xY',
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
            .with_content(%r{<hook_url>https://jira\.example\.com/rest\?x=1&y=2</hook_url>})
            .with_content(%r{<api_key>svc-jira:Abc123\.,_-xY</api_key>})
            .with_content(%r{<rule_id>100001,100002,100003</rule_id>})
            .with_content(%r{<alert_format>json</alert_format>})
        }
        it 'never emits XML entities — Wazuh decodes none of them' do
          is_expected.to contain_concat__fragment('custom-jira')
            .without_content(%r{&(quot|amp|lt|gt|#\d+);})
        end
        it 'renders <options> the integrator can parse verbatim as JSON' do
          expect(JSON.parse(verbatim_options('custom-jira')))
            .to eq('project' => 'SPKSUP & <Ops>')
        end
        it 'keeps the <options> JSON free of raw &, <, > via \\uXXXX escapes' do
          expect(verbatim_options('custom-jira')).not_to match(%r{[&<>]})
        end
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

      context 'declared like the custom-icinga alarm integration' do
        let(:title) { 'custom-icinga' }
        let(:params) do
          {
            hook_url: 'https://icinga.example.com:5665/v1/actions/process-check-result',
            api_key: 'icinga-user:Zz9.,_-Abc',
            in_rule_id: %w[100001 100002],
            in_level: '',
            in_format: 'json',
            in_options: { 'host' => 'wazuh-manager01.example.com', 'service' => 'wazuh_alarms' },
          }
        end

        it { is_expected.to compile.with_all_deps }
        it 'renders <options> defining host and service for the integrator' do
          expect(JSON.parse(verbatim_options('custom-icinga')))
            .to eq('host' => 'wazuh-manager01.example.com', 'service' => 'wazuh_alarms')
        end
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
        }
        it 'renders the raw JSON string parseable verbatim' do
          expect(JSON.parse(verbatim_options('custom-legacy')))
            .to eq('raw' => 'json string')
        end
      end

      context 'declared with an in_options string that is not JSON' do
        let(:title) { 'custom-broken' }
        let(:params) { { in_options: 'host=icinga, service=wazuh' } }

        it 'fails the catalog instead of shipping unparseable options' do
          is_expected.to compile.and_raise_error(%r{<options>.*not valid JSON})
        end
      end

      context 'declared with JSON options that are not an object' do
        let(:title) { 'custom-non-object' }

        ['null', '[]'].each do |options|
          context "when in_options is #{options}" do
            let(:params) { { in_options: options } }

            it 'fails the catalog before the integration script receives it' do
              is_expected.to compile.and_raise_error(%r{<options>.*must be a JSON object})
            end
          end
        end
      end

      context 'declared with a value containing a literal < (unrepresentable in ossec.conf)' do
        let(:title) { 'custom-lt' }
        let(:params) { { api_key: 'user:S3cr3t<Value' } }

        it 'fails the catalog naming the field' do
          is_expected.to compile.and_raise_error(%r{<api_key>.*'<'})
        end
        it 'does not leak the secret value in the error' do
          expect { catalogue }.to raise_error(StandardError) { |e|
            expect(e.message).not_to include('S3cr3t')
          }
        end
      end

      context 'declared with a value ending in a lone backslash (os_xml escapes \<)' do
        let(:title) { 'custom-backslash' }
        let(:params) { { api_key: 'user:S3cr3tTrail\\' } }

        it 'fails the catalog without leaking the secret value' do
          is_expected.to compile.and_raise_error(%r{<api_key>.*odd number of backslashes})
          expect { catalogue }.to raise_error(StandardError) { |e|
            expect(e.message).not_to include('S3cr3t')
          }
        end
      end

      context 'declared with a value ending in an even run of backslashes' do
        let(:title) { 'custom-evenslash' }
        let(:params) { { api_key: 'user:Tail\\\\' } }

        it { is_expected.to compile.with_all_deps }
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
