class acrc_users {

    $users = hiera("users")
    $groups = hiera("groups")

    # Turn all heira users in to virtual users.
    create_resources("@group", $groups)
    $user_defaults = {
        managehome => true,
        ensure => present,
    }
    create_resources("@user", $users, $user_defaults)

    Group <||>

    user { 'root':
        ensure => 'present',
        uid     => 0,
        gid     => 0,
        shell   => '/bin/bash',
        home    => '/root',
        comment => 'root',
        password  => $root_pw,
    }
    User <| groups == 'acrcadmin' |>
        
}
