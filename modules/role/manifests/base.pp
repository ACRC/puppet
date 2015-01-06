class role::base {
    include sitefirewall
    include motd
    include puppet
    include acrc_ssh
    include acrc_users
    include authconfig
    include sudo
    include eximsimple
    include ntp
    include acrc_repos
    include uob_networker
}
