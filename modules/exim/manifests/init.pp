class exim (
    $smarthost = $exim::params::smarthost,
    $domain = $exim::params::domain,
    $local_interfaces = $exim::params::local_interfaces,
    $root = $exim::params::root,
) inherits exim::params {

    package { 'postfix':
        ensure => absent
    }

    package { 'exim':
        ensure => present
    }

    service { 'exim':
        ensure => running
    }

    file { '/etc/exim/exim.conf':
        ensure => 'present',
        content => template('exim/exim.conf.erb'),
        notify => Service[exim],
        require => Package['exim'],
    }

    file { '/etc/aliases':
        content => template('exim/aliases.erb')
    }
}
