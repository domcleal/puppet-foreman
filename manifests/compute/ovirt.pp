# Foreman oVirt compute resource support
#
# Provides support for oVirt compute resources
#
# @param version [Optional[String]]
#                Package version to install, defaults to installed
#                group: Foreman oVirt compute resource support
#
class foreman::compute::ovirt ( $version = 'installed' ) {
  package { 'foreman-ovirt':
    ensure => $version,
    tag    => [ 'foreman-compute', ],
  }
}
