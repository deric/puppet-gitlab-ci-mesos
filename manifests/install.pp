# Install binary package
#
class gitlab-ci-mesos::install (
  $ensure  = 'present',
  $log_dir = '/var/log/gitlab-ci'
) {

  file { $log_dir:
    ensure => directory,
  }

  # a debian (or other binary package) must be available,
  package { 'gitlab-ci-mesos':
    ensure  => $ensure,
  }
}
