class uob_networker (
  $service_ports = $uob_networker::params::service_ports,
  $connection_ports = $uob_networker::params::connection_ports,
  $server = $uob_networker::params::server
) inherits uob_networker::params {

  $shortserver = inline_template("<%= '${server}'.split('.')[0] %>")

  package { 'lgtoclnt':
    ensure => present
  }

  file { '/.nsr':
    ensure => file,
    source => 'puppet:///modules/uob_networker/dotnsr',
  }

  file { '/nsr/res':
    ensure  => 'directory',
    recurse => true,
    require => Package['lgtoclnt']
  }

  file { '/nsr/res/servers':
    ensure  => file,
    content => "${server}
${shortserver}
",
    require => File['/nsr/res']
  }

  service { 'networker':
    ensure  => running,
    require => Package['lgtoclnt']
  }

  exec { '/usr/bin/nsrports -s $server -S $service_ports':
    refreshonly => true,
    subscribe   => Package['lgtoclnt'],
    require     => Service['networker'],
  }

  exec { '/usr/bin/nsrports -S $service_ports':
    refreshonly => true,
    subscribe   => Package['lgtoclnt'],
    require     => Service['networker'],
  }

  exec { '/usr/bin/nsrports -s $server -C $connection_ports':
    refreshonly => true,
    subscribe   => Package['lgtoclnt'],
    require     => Service['networker'],
  }

  exec { '/usr/bin/nsrports -C $connection_ports':
    refreshonly => true,
    subscribe   => Package['lgtoclnt'],
    require     => Service['networker'],
  }

  firewall {'050 allow central backups service ports':
    port   => $service_ports,
    action => accept,
    source => $server
  }

  firewall {'050 allow central backups connection ports':
    port   => $connection_ports,
    action => accept,
    source => $server
  }

}
