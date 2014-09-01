class acrc_firewall {
    include firewall
    include acrc_firewall::pre
    include acrc_firewall::post
}
