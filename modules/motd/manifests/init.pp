class motd($text = "") {

    file { 'motd':
        path    => '/etc/motd',
        ensure  => file,
        content => $text, 
    }
}
