class role::base {
    include motd
    include puppet
}

class role::puppetmaster {
    class { '::puppet':
        server  => true,
        server_reports        => 'store',
        server_external_nodes => '',
    }
}
