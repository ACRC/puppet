class acrc_repos {

    $yumrepos = hiera_hash('repo::yum')
    if $yumrepos {
        create_resources('yumrepo', $yumrepos)
    }
    
}
