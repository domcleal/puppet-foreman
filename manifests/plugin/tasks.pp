# Foreman Tasks
#
# Installs the foreman-tasks plugin
#
# @param package [String]
#                Package name to install, use ruby193-rubygem-foreman-tasks on Foreman 1.8/1.9 on EL
#                group: Foreman Tasks
#
# @param service [String]
#                Service name
#                group: Foreman Tasks
#
class foreman::plugin::tasks(
  $package = $foreman::plugin::tasks::params::package,
  $service = $foreman::plugin::tasks::params::service,
) inherits foreman::plugin::tasks::params {
  foreman::plugin { 'tasks':
    package => $package,
  } ~>
  service { 'foreman-tasks':
    ensure => running,
    enable => true,
    name   => $service,
  }
}
