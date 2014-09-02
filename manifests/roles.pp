class role::base {
    include motd
    include puppet
}

class role::puppetmaster() {
    include acrc_puppet::master
    include foreman
    include foreman_proxy
	

    class { 'puppetdb': }
    class { 'puppetdb::master::config':
	manage_storeconfigs => false
    }


    postgresql::server::db { $foreman::db_database:
        user     => $foreman::db_username,
        password => $foreman::db_password,
        owner    => $foreman::db_username,
    }
}
