

class gitlab-ci-mesos::install (
  $ensure = gitlab-ci-mesos::ensure,
) {

  # a debian (or other binary package) must be available,
  package { 'gitlab-ci-mesos':
    ensure  => $ensure,
  }
}
