require 'spec_helper'

describe 'wazuh::audit' do
  on_supported_os(
    supported_os: [{ 'operatingsystem' => 'RedHat', 'operatingsystemrelease' => ['9'] }],
  ).each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts.merge(concat_basedir: '/dummy') }
      let(:pre_condition) { "service { 'wazuh-agent': ensure => running }" }
      let(:params) { { service_notify: 'wazuh-agent' } }
      let(:audit_reload_command) { '/sbin/auditctl --signal reload' }

      it { is_expected.to compile.with_all_deps }
      it {
        is_expected.to contain_service('auditd')
          .with_restart(audit_reload_command)
          .that_notifies('Service[wazuh-agent]')
      }
      it {
        is_expected.to contain_exec('Restore Wazuh whodata audit rules')
          .with_command(audit_reload_command)
          .with_unless('/sbin/auditctl -l | /bin/grep -F -q wazuh_fim')
          .that_requires('Service[auditd]')
          .that_notifies('Service[wazuh-agent]')
      }
    end
  end

  context 'on legacy RedHat-family systems' do
    let(:facts) do
      {
        concat_basedir: '/dummy',
        kernel: 'Linux',
        os: {
          'family' => 'RedHat',
          'name' => 'RedHat',
          'release' => {
            'major' => '7',
          },
        },
      }
    end
    let(:pre_condition) { "service { 'wazuh-agent': ensure => running }" }
    let(:params) { { service_notify: 'wazuh-agent' } }

    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_service('auditd').with_restart('/sbin/service auditd reload') }
    it { is_expected.to contain_exec('Restore Wazuh whodata audit rules').with_command('/sbin/service auditd reload') }
  end
end
