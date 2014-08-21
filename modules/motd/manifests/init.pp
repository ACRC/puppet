class motd {

    file { 'motd':
        path    => '/etc/motd',
        ensure  => file,
        content => template("motd/motd.erb"),
    }
}
