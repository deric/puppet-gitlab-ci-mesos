require 'spec_helper'

describe 'gitlab-ci-mesos' do

  it { should contain_class('gitlab-ci-mesos') }

  context 'install package' do

    it { should contain_class('gitlab-ci-mesos::install') }

    it { should contain_package('gitlab-ci-mesos').with({
      'ensure' => 'present'
    }) }

    it { should contain_file('/var/log/gitlab-ci').with({
      'ensure' => 'directory'
    }) }
  end
end