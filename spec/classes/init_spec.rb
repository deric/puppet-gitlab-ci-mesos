require 'spec_helper'

describe 'gitlab-ci-mesos' do

  context 'install package' do

    it { should contain_package('gitlab-ci-mesos').with({
      'ensure' => 'present'
    }) }
  end
end