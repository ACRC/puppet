# == Class: sitefirewall
#
# A module to provide sensible defaults for puppetlabs/firewall.
#
# === Examples
#
#  class { 'sitefirewall':
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
class sitefirewall {
  include firewall
  include sitefirewall::pre
  include sitefirewall::post
}
