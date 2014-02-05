
class gitlab-ci-mesos(
  $ensure       = hiera('gitlab-ci-mesos::version', 'present')
) {
  # master and slave creates separate logs automatically
  # TODO: currently not used
  $log_dir      = hiera('gitlab-ci-mesos::log_dir', '/var/log/gitlab-ci')
  $conf_dir     = hiera('gitlab-ci-mesos::conf_dir', '/etc/gitlab-ci')


  class {'gitlab-ci-mesos::install':
    ensure   => $ensure,
    log_dir  => $log_dir,
  }

}