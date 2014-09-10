class motd($text = '') {

    file { 'motd':
        ensure  => file,
        path    => '/etc/motd',
        content => $text,
    }
}
