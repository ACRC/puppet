require 'spec_helper'
describe 'sitefirewall::post' do

  context 'with defaults for all parameters' do
    it { should contain_class('sitefirewall::post') }
  end
end
