require 'spec_helper'
describe 'sitefirewall' do
  let(:facts) { {:kernel => 'Linux' } }

  context 'with defaults for all parameters' do
    it { should contain_class('sitefirewall') }
  end
end
