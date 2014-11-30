require 'beaker-rspec'
require 'beaker-rspec/helpers/serverspec'

unless ENV['BEAKER_provision'] == 'no'
  hosts.each do |host|
    # Install Puppet
    foss_opts = { :default_action => 'gem_install' }


    hosts.each do |host|
      if default.is_pe?; then install_pe; else install_puppet( foss_opts ); end
      on hosts, "mkdir -p #{host['distmoduledir']}"
    end
  end
end

RSpec.configure do |c|
  # Project root
  proj_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))

  # Readable test descriptions
  c.formatter = :documentation

  pp = <<-EOS
    class { 'epel': }
  EOS

  # Configure all nodes in nodeset
  c.before :suite do
    # Install module
    puppet_module_install(:source => proj_root, :module_name => 'eximsimple')
    hosts.each do |host|
      on host, puppet('module','install','puppetlabs-stdlib'), { :acceptable_exit_codes => [0,1] }
      on host, puppet('module','install','stahnma-epel'), { :acceptable_exit_codes => [0,1] }
      apply_manifest(pp, :catch_failures => true)
    end
  end
end
