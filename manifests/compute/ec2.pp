# Foreman EC2 compute resource support
#
# Provides support for EC2 compute resources
#
# @param version [Optional[String]]
#                Package version to install, defaults to installed
#                group: Foreman EC2 compute resource support
#
class foreman::compute::ec2($version = 'installed') {
  package { 'foreman-ec2':
    ensure => $version,
    tag    => [ 'foreman-compute', ],
  }
}
