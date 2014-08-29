
class acrc_puppet::master {
    class { '::puppet':
        server  => true,
        server_reports        => 'store',
        server_external_nodes => '',
    }

    selinux::module { 'puppet':
        ensure => 'present',
        source => 'puppet:///modules/acrc_puppet/puppet.te',
    }
}
