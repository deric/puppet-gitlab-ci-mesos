# Scheduler is a service (Mesos framework)
# that communicates with GitLab CI
#
class gitlab-ci-mesos::scheduler (
  $ensure          = present,
  $mesos_master    = undef,
  $gitlab_ci_url   = undef,
  $gitlab_ci_token = undef,
  $gitlab_ci_api   = 'v1',
  $gitlab_key      = '~/.ssh/id_rsa.pub',
  $gitlab_ci_dir   = '~/tmp/gitlab-runner',
  $mesos_lib       = '/usr/local/lib/libmesos.so',
  $log_dir         = '/var/log/gitlab-ci',
  $conf_dir        = '/etc/gitlab-ci',
) inherits gitlab-ci-mesos {


  file { $conf_dir:
    ensure => directory,
  }

  file { "$conf_dir/scheduler.conf":
    ensure  => present,
    content => template('gitlab-ci-mesos/scheduler.conf.erb'),
    require => File[$conf_dir],
  }

  service { 'gitlab-ci':
    ensure     => 'running',
    hasstatus  => true,
    hasrestart => true,
    enable     => $enable,
    subscribe  => [File["$conf_dir/scheduler.conf"]],
    require    => [File[$conf_dir], File["$conf_dir/scheduler.conf"]]
  }

}