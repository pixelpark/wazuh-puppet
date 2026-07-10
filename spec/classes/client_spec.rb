require 'spec_helper'
describe 'wazuh::agent' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts.merge(concat_basedir: '/dummy')
      end

      context 'with defaults for all parameters' do
        it 'requires a register endpoint while client key management is enabled' do
          is_expected.to compile.and_raise_error(%r{wazuh_register_endpoint parameter is needed})
        end
      end

      context 'with a register endpoint' do
        let(:params) do
          {
            wazuh_register_endpoint: 'wazuh.example.com',
          }
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_class('wazuh::agent') }
        it { is_expected.to contain_concat('agent_ossec.conf') }
        it { is_expected.not_to contain_concat__fragment('ossec.conf_agent').with_content(%r{<address>}) }
      end

      context 'with a register and reporting endpoint' do
        let(:params) do
          {
            wazuh_register_endpoint: 'wazuh.example.com',
            wazuh_reporting_endpoint: 'wazuh.example.com',
          }
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_concat__fragment('ossec.conf_agent').with_content(%r{<address>wazuh\.example\.com</address>}) }
      end
    end
  end
end
