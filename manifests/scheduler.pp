

class gitlab-ci-mesos::scheduler (
  $ensure = gitlab-ci-mesos::ensure,
) inherits gitlab-ci-mesos {



  service { "gitlab-ci":
    ensure     => 'running',
    hasstatus  => true,
    hasrestart => true,
    enable     => $enable,
    subscribe  => [ File['/etc/gitlab-ci/scheduler.conf']
    ],
  }

}