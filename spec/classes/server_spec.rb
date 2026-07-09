require 'spec_helper'
describe 'wazuh::manager' do
  # The manager is Linux-only: the class fails on Windows by design, and
  # params_manager has no Windows coverage for the server-side defaults.
  on_supported_os.reject { |os, _facts| os.start_with?('windows') }.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts.merge(concat_basedir: '/dummy')
      end

      context 'with defaults for all parameters' do
        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_class('wazuh::manager') }
        it { is_expected.to contain_package('wazuh-manager') }
        it { is_expected.to contain_service('wazuh-manager') }
        it { is_expected.to contain_concat('manager_ossec.conf') }
      end
    end
  end
end
