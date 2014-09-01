
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

    firewall { '050 accept Puppet':
        port    => 8140,
        proto   => tcp,
        action  => accept,
    }


    firewall { '050 accept web':
        port    => [80, 443],
        proto   => tcp,
        action  => accept,
    }

    file { '/etc/puppet/hiera.yaml':
        ensure => file,
        source => 'puppet:///modules/acrc_puppet/hiera.yaml',
    }
}
