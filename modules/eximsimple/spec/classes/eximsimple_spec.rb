require 'spec_helper'

describe 'eximsimple' do
  it {
    should contain_package('postfix').with({
      'ensure' => 'absent',
    })
    should contain_package('exim').with({
      'ensure' => 'present',
    })
    should contain_service('exim').with({
      'ensure' => 'running',
    })
    should contain_file('/etc/exim/exim.conf').with({
      'ensure' => 'present',
    })
    should contain_file('/etc/aliases')
  }
end
