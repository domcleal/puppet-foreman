# Foreman LibVirt compute resource support
#
# Provides support for Libvirt compute resources
#
# @param version [Optional[String]]
#                Package version to install, defaults to installed
#                group: Foreman LibVirt compute resource support
#
class foreman::compute::libvirt ( $version = 'installed' ) {
  package { 'foreman-libvirt':
    ensure => $version,
    tag    => [ 'foreman-compute', ],
  }
}
