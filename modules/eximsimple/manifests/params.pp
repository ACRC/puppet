# == Class: eximsimple::params
#
# === Parameters
#
# [smarthost]
#   The host to send all mail via. Can be any valid format that Exim accepts.
#   e.g. smtp.example.com/MX
#
# [domain]
#   The domain to add to the shortname.
#   e.g example.com
#
# [local_interfaces]
#   The interface to listen on.
#   e.g. 127.0.0.1
#
# [root]
#   The address to send mails for to root to.
#   e.g. root-mailbox@example.com
#

class eximsimple::params {
    $smarthost = 'smtp.example.com/mx'
    $domain = 'example.com'
    $local_interfaces = '127.0.0.1'
    $root = 'root@example.com'
}
