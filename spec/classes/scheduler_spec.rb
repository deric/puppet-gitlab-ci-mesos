require 'spec_helper'

describe 'gitlab-ci-mesos::scheduler' do
  context 'basic install' do

    it { should contain_class('gitlab-ci-mesos::scheduler') }

    it { should contain_service('gitlab-ci').with({
      'ensure' => 'running'
    }) }

    it { should contain_file('/etc/gitlab-ci').with({
      'ensure' => 'directory'
    }) }

    it { should contain_file('/etc/gitlab-ci/scheduler.conf').with({
      'ensure' => 'present'
    }) }
  end
end