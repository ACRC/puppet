class role::base {
    include acrc_firewall
    include motd
    include puppet
    include acrc_ssh
}
