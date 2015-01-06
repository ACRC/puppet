# == Class: sitefirewall::post
#
# Default post rules.
class sitefirewall::post {
  firewall { '999 drop all':
    proto  => 'all',
    action => 'drop',
    before => undef,
  }
}

