class foreman::database {
  if $foreman::db_manage {
    $db_class = "foreman::database::${foreman::db_type}"

    class { $db_class: } ~>
    exec { "dbmigrate":
      command     => "/opt/rh/ruby193/root/usr/bin/rake db:migrate permissions:reset",
      cwd         => $foreman::app_root,
      user        => $foreman::user,
      environment => [
        "HOME=${foreman::app_root}",
        "PATH=/opt/rh/ruby193/root/usr/bin",
        "LD_LIBRARY_PATH=/opt/rh/ruby193/root/usr/lib64",
        "RAILS_ENV=production"
      ],
      logoutput => 'on_failure',
      refreshonly => true,
    }
  }
}
