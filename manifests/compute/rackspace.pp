# Foreman Rackspace compute resource support
#
# Provides support for Rackspace compute resources
#
# @param version [Optional[String]]
#                Package version to install, defaults to installed
#                group: Foreman Rackspace compute resource support
#
class foreman::compute::rackspace ( $version = 'installed' ) {
  package { 'foreman-rackspace':
    ensure => $version,
    tag    => [ 'foreman-compute', ],
  }
}
