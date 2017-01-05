# Foreman Google Compute Engine compute resource support
#
# Provides support for Google Compute Engine compute resources
#
# @param version [Optional[String]]
#                Package version to install, defaults to installed
#                group: Foreman Google Compute Engine compute resource support
#
class foreman::compute::gce ( $version = 'installed' ) {
  package { 'foreman-gce':
    ensure => $version,
    tag    => [ 'foreman-compute', ],
  }
}
