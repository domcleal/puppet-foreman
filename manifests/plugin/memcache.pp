# Foreman Memcache plugin
#
# This class installs the memcache plugin and configuration file
#
# @param hosts      [Array[String]]
#                   an array of hosts running memcache
#                   group: Foreman Memcache plugin
#
# @param expires_in [Integer[0]]
#                   global default for key TTL in seconds
#                   group: Foreman Memcache plugin
#
# @param namespace  [String]
#                   prepends each key with this value to provide simple namespacing
#                   group: Foreman Memcache plugin
#
# @param compress   [Boolean]
#                   will gzip-compress values larger than 1K
#                   group: Foreman Memcache plugin
#
class foreman::plugin::memcache (
  $hosts      = $::foreman::plugin::memcache::params::hosts,
  $expires_in = $::foreman::plugin::memcache::params::expires_in,
  $namespace  = $::foreman::plugin::memcache::params::namespace,
  $compress   = $::foreman::plugin::memcache::params::compress,
) inherits foreman::plugin::memcache::params {

  validate_array($hosts)
  validate_bool($compress)
  validate_integer($expires_in)
  validate_string($namespace)

  foreman::plugin {'memcache':
    config => template('foreman/foreman_memcache.yaml.erb'),
  }
}
