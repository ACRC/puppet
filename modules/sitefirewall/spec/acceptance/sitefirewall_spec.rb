require 'spec_helper_acceptance'

describe 'sitefirewall class' do
  describe 'running puppet code' do
    it 'apply manifest' do
      pp = <<-EOS
        class { 'sitefirewall': }
      EOS

      # Run it twice and test for idempotency
      apply_manifest(pp, :catch_failures => true)
      expect(apply_manifest(pp, :catch_failures => true).exit_code).to be_zero
    end
  end

end
