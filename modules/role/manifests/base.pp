class role::base {
    include acrc_firewall
    include motd
    include puppet
    include acrc_ssh
    include acrc_users
    include authconfig
    include sudo
    include exim
    include ntp
    include acrc_repos
    include uob_networker
}
