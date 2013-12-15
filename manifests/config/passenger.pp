# Configure the foreman service using passenger
#
# === Parameters:
#
# $listen_on_interface::    Specify which interface to bind passenger to. Defaults to all interfaces.
#
# $scl_prefix::             SCL prefix
#
class foreman::config::passenger(
  $apache_conf_dir     = $foreman::apache_conf_dir,
  $app_root            = $foreman::app_root,
  $listen_on_interface = $foreman::passenger_interface,
  $scl_prefix          = $foreman::passenger_scl,
  $passenger_root      = '/usr/lib/ruby/gems/1.8/gems/passenger-4.0.5',
  $ssl                 = $foreman::ssl,
  $ssl_cert            = $foreman::client_ssl_cert,
  $ssl_key             = $foreman::client_ssl_key,
  $ssl_ca              = $foreman::client_ssl_ca,
  $use_vhost           = $foreman::use_vhost,
  $user                = $foreman::user
) {

  # validate parameter values
  validate_string($listen_on_interface)
  validate_bool($ssl)

  $docroot = "${app_root}/public"

  include apache
  include apache::mod::headers

  if $scl_prefix {
    class {'apache::mod::passenger':
      passenger_root => $passenger_root,
    }
  } else {
    include ::apache::mod::passenger
  }

  if $use_vhost {
    # Workaround so apache::vhost doesn't attempt to create a directory
    file { $docroot: }

    # Check the value in case the interface doesn't exist, otherwise listen on all interfaces
    if $listen_on_interface and $listen_on_interface in split($::interfaces, ',') {
      $listen_interface = inline_template("<%= @ipaddress_${listen_on_interface} %>")
    } else {
      $listen_interface = undef
    }

    apache::vhost { 'foreman':
      servername      => $::fqdn,
      serveraliases   => ['foreman'],
      ip              => $listen_interface,
      port            => 80,
      docroot         => $docroot,
      priority        => '5',
      options         => ['none'],
      custom_fragment => template('foreman/apache-fragment.conf.erb', 'foreman/_assets.conf.erb'),
    }

    if $ssl {
      apache::vhost { 'foreman-ssl':
        servername        => $::fqdn,
        serveraliases     => ['foreman'],
        ip                => $listen_interface,
        port              => 443,
        docroot           => $docroot,
        priority          => '5',
        options           => ['none'],
        ssl               => true,
        ssl_cert          => $ssl_cert,
        ssl_key           => $ssl_key,
        ssl_chain         => $ssl_ca,
        ssl_ca            => $ssl_ca,
        ssl_verify_client => 'optional',
        ssl_options       => '+StdEnvVars',
        ssl_verify_depth  => '3',
        custom_fragment   => template('foreman/apache-fragment.conf.erb', 'foreman/_assets.conf.erb'),
      }
    }
  } else {
    file { 'foreman_vhost':
      path    => "${apache_conf_dir}/foreman.conf",
      content => template('foreman/foreman-apache.conf.erb'),
      mode    => '0644',
    }

    if $ssl {
      fail('Use of ssl = true and use_vhost = false is unsupported')
    }
  }

  file { ["${app_root}/config.ru", "${app_root}/config/environment.rb"]:
    owner => $user,
  }
}
