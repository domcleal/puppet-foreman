# Foreman OpenStack compute resource support
#
# Provides support for OpenStack compute resources
#
# @param version [Optional[String]]
#                Package version to install, defaults to installed
#                group: Foreman OpenStack compute resource support
#
class foreman::compute::openstack($version = 'installed') {
  package { 'foreman-openstack':
    ensure => $version,
    tag    => [ 'foreman-compute', ],
  }
}
