class role::base {
    include motd
    include puppet
}

class role::puppetmaster {
    include acrc_puppet::master
    include foreman
    include foreman_proxy
}
