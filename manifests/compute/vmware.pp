# Foreman VMware compute resource support
#
# Provides support for VMware compute resources
#
# @param version [Optional[String]]
#                Package version to install, defaults to installed
#                group: Foreman VMware compute resource support
#
class foreman::compute::vmware ( $version = 'installed' ) {
  package { 'foreman-vmware':
    ensure => $version,
    tag    => [ 'foreman-compute', ],
  }
}
