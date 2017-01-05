# Foreman command line interface
#
# This class installs the Hammer command line interface (CLI).
#
# @param foreman_url          [Optional[Stdlib::HTTPUrl]]
#                             URL on which Foreman runs
#
# @param username             [Optional[String]]
#                             Username for authentication
#
# @param password             [Optional[String]]
#                             Password for authentication
#
# @param manage_root_config   [Boolean]
#                             Whether to manage /root/.hammer configuration.
#                             group: Advanced parameters
#
# @param refresh_cache        [Boolean]
#                             Check API documentation cache status on each request
#                             group: Advanced parameters
#
# @param request_timeout      [Integer[-1]]
#                             API request timeout, set -1 for infinity
#                             group: Advanced parameters
#
# @param hammer_plugin_prefix [String]
#                             Hammer plugin package prefix based normally on platform
#                             group: Advanced parameters
#
# @param version              [String]
#                             foreman-cli package version, it's passed to ensure parameter of package resource
#                             can be set to specific version number, 'latest', 'present' etc.
#                             group: Advanced parameters
#
class foreman::cli (
  $foreman_url          = $::foreman::cli::params::foreman_url,
  $version              = $::foreman::cli::params::version,
  $manage_root_config   = $::foreman::cli::params::manage_root_config,
  $username             = $::foreman::cli::params::username,
  $password             = $::foreman::cli::params::password,
  $refresh_cache        = $::foreman::cli::params::refresh_cache,
  $request_timeout      = $::foreman::cli::params::request_timeout,
  $hammer_plugin_prefix = $::foreman::cli::params::hammer_plugin_prefix,
) inherits foreman::cli::params {
  # Inherit URL & auth parameters from foreman class if possible
  #
  # The parameter existence must be checked in case strict variables is enabled, but this will only
  # work since PUP-4072 (3.7.5+) due to a bug resolving variables outside of this class.
  if versioncmp($::puppetversion, '3.7.5') < 0 or defined('$foreman::foreman_url') {
    $foreman_url_real = pick($foreman_url, $::foreman::foreman_url)
    $username_real    = pick($username, $::foreman::admin_username)
    $password_real    = pick($password, $::foreman::admin_password)
  } else {
    $foreman_url_real = $foreman_url
    $username_real    = $username
    $password_real    = $password
  }
  validate_string($foreman_url_real, $username_real, $password_real)
  validate_bool($manage_root_config, $refresh_cache)

  package { 'foreman-cli':
    ensure => $version,
  } ->
  file { '/etc/hammer/cli.modules.d/foreman.yml':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('foreman/hammer_etc.yml.erb'),
  }

  # Separate configuration for admin username/password
  if $manage_root_config {
    file { '/root/.hammer':
      ensure => directory,
      owner  => 'root',
      group  => 'root',
      mode   => '0600',
    }
    file { '/root/.hammer/cli.modules.d':
      ensure => directory,
      owner  => 'root',
      group  => 'root',
      mode   => '0600',
    }
    file { '/root/.hammer/cli.modules.d/foreman.yml':
      ensure  => file,
      owner   => 'root',
      group   => 'root',
      mode    => '0600',
      replace => false,
      content => template('foreman/hammer_root.yml.erb'),
    }
  }
}
