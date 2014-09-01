class acrc_ssh {
    package { 'openssh-server':
        ensure => 'present',
    }

    package { 'openssh-clients':
        ensure => 'present',
    }

    firewall { '010 accept SSH':
        port    => 22,
        proto   => tcp,
        action  => accept,
    }

}
