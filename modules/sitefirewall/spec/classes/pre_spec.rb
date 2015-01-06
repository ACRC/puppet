require 'spec_helper'
describe 'sitefirewall::pre' do

  context 'with defaults for all parameters' do
    it { should contain_class('sitefirewall::pre') }
  end
end
