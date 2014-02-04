require 'spec_helper'

describe 'gitlab-ci-mesos::scheduler' do
  context 'basic install' do

    it { should contain_service('gitlab-ci').with({
      'ensure' => 'running'
    }) }
  end
end