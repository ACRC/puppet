# == Class: eximsimple
#
# A module to configuring exim as a simple MTA to deliver all mail via a smarthost.
# USeful for any system that needs to deliver mail.
#
# === Examples
#
#  class { 'eximsimple':
#    domain => 'example.com',
#    root => 'root@example.com',
#    smarthost => 'smtp.example.com/mx',
#  }
#
# === Authors
#
# Dan Foster <dan@zem.org.uk>
#
# === Copyright
#
# Copyright 2014 Dan Foster, unless otherwise noted.
#
class eximsimple (
  $smarthost = $eximsimple::params::smarthost,
  $domain = $eximsimple::params::domain,
  $local_interfaces = $eximsimple::params::local_interfaces,
  $root = $eximsimple::params::root,
) inherits ::eximsimple::params {

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
    ensure  => 'present',
    content => template('eximsimple/exim.conf.erb'),
    notify  => Service[exim],
    require => Package['exim'],
  }


  file { '/etc/aliases':
    content => template('eximsimple/aliases.erb')
  }
}

