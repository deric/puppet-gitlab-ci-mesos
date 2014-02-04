

class gitlab-ci-mesos::scheduler (
  $ensure = gitlab-ci-mesos::ensure,
) inherits gitlab-ci-mesos {


  file { $conf_dir:
    ensure => directory,
  }

  service { "gitlab-ci":
    ensure     => 'running',
    hasstatus  => true,
    hasrestart => true,
    enable     => $enable,
    subscribe  => [ File['/etc/gitlab-ci/scheduler.conf']
    ],
    require    => File[$conf_dir]
  }

}