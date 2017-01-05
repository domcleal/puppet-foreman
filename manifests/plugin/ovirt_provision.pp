# oVirt Provisioning Plugin
#
# Installs the ovirt_provision plugin
#
# @param package [String]
#                Package name to install, use ruby193-rubygem-ovirt_provision_plugin on Foreman 1.8/1.9 on EL
#                group: oVirt Provisioning Plugin
#
class foreman::plugin::ovirt_provision (
  $package = $foreman::plugin::ovirt_provision::params::package,
) inherits foreman::plugin::ovirt_provision::params {
  foreman::plugin {'ovirt_provision':
    package => $package,
  }
}
