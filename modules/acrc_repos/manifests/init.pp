class acrc_repos {

    $yumrepos = hiera_hash('repo::yum')
    if $yumrepos {
        create_resources('yumrepo', $yumrepos)
    }

    if $osfamily == 'RedHat' {
        package { 'yum-cron':
            ensure => present,
        }

        service { 'yum-cron':
            ensure     => running,
            hasstatus  => true,
            hasrestart => true,
            require    => Package['yum-cron'],
        }

    }
    
}
