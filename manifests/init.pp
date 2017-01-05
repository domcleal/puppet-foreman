# Manage your foreman server
#
# @param admin_username            [String]
#                                  Username for the initial admin user
#
# @param admin_password            [String]
#                                  Password of the initial admin user, default is randomly generated
#
# @param admin_first_name          [Optional[String]]
#                                  First name of the initial admin user
#
# @param admin_last_name           [Optional[String]]
#                                  Last name of the initial admin user
#
# @param admin_email               [Optional[String]]
#                                  E-mail address of the initial admin user
#
# @param db_manage                 [Boolean]
#                                  if enabled, will install and configure the database server on this host
#
# @param db_type                   [Enum['mysql', 'postgresql', 'sqlite']]
#                                  Database 'production' type
#
# @param email_delivery_method     [Optional[Enum['sendmail', 'smtp']]]
#                                  Email delivery method
#
# @param email_smtp_address        [Optional[String]]
#                                  SMTP server hostname, when delivery method is SMTP
#
# @param email_smtp_port           [Integer[0, 65535]]
#                                  SMTP port
#
# @param email_smtp_domain         [Optional[String]]
#                                  SMTP HELO domain
#
# @param email_smtp_authentication [Enum['none', 'plain', 'login', 'cram-md5']]
#                                  SMTP authentication method
#
# @param email_smtp_user_name      [Optional[String]]
#                                  Username for SMTP server auth, if authentication is enabled
#
# @param email_smtp_password       [Optional[String]]
#                                  Password for SMTP server auth, if authentication is enabled
#
# @param locations_enabled         [Boolean]
#                                  Enable locations?
#
# @param organizations_enabled     [Boolean]
#                                  Enable organizations?
#
# @param initial_organization      [Optional[String]]
#                                  Name of an initial organization
#
# @param initial_location          [Optional[String]]
#                                  Name of an initial location
#
# @param ipa_authentication        [Boolean]
#                                  Enable configuration for external authentication via IPA
#
# @param puppetrun                 [Boolean]
#                                  Should Foreman be able to start Puppet runs on nodes
#
# @param email_source              [String]
#                                  Template to use for email configuration file
#                                  group: Advanced parameters
#
# @param foreman_url               [Stdlib::HTTPUrl]
#                                  URL on which foreman is going to run
#                                  group: Advanced parameters
#
# @param unattended                [Boolean]
#                                  Should Foreman manage host provisioning as well
#                                  group: Advanced parameters
#
# @param authentication            [Boolean]
#                                  Enable user authentication. Initial credentials are set using admin_username
#                                  and admin_password.
#                                  group: Advanced parameters
#
# @param passenger                 [Boolean]
#                                  Configure foreman via apache and passenger
#                                  group: Advanced parameters
#
# @param passenger_ruby            [Optional[String]]
#                                  Ruby interpreter used to run Foreman under Passenger
#                                  group: Advanced parameters
#
# @param passenger_ruby_package    [Optional[String]]
#                                  Package to install to provide Passenger libraries for the active Ruby
#                                  interpreter
#                                  group: Advanced parameters
#
# @param plugin_prefix             [String]
#                                  String which is prepended to the plugin package names
#                                  group: Advanced parameters
#
# @param use_vhost                 [Boolean]
#                                  Enclose apache configuration in VirtualHost tags
#                                  group: Advanced parameters
#
# @param servername                [String]
#                                  Server name of the VirtualHost in the webserver
#                                  group: Advanced parameters
#
# @param serveraliases             [Array[String]]
#                                  Server aliases of the VirtualHost in the webserver
#                                  group: Advanced parameters
#
# @param ssl                       [Boolean]
#                                  Enable and set require_ssl in Foreman settings (note: requires passenger, SSL does not apply to kickstarts)
#                                  group: Advanced parameters
#
# @param custom_repo               [Boolean]
#                                  No need to change anything here by default
#                                  if set to true, no repo will be added by this module, letting you to
#                                  set it to some custom location.
#                                  group: Advanced parameters
#
# @param repo                      [String]
#                                  This can be stable, nightly or a specific version i.e. 1.7
#                                  group: Advanced parameters
#
# @param configure_epel_repo       [Boolean]
#                                  If disabled the EPEL repo will not be configured on Red Hat family systems.
#                                  group: Advanced parameters
#
# @param configure_scl_repo        [Boolean]
#                                  If disabled the SCL repo will not be configured on Red Hat clone systems.
#                                  (Currently only installs repos for CentOS and Scientific)
#                                  group: Advanced parameters
#
# @param selinux                   [Optional[Boolean]]
#                                  When undef, foreman-selinux will be installed if SELinux is enabled
#                                  setting to false/true will override this check (e.g. set to false on 1.1)
#                                  group: Advanced parameters
#
# @param gpgcheck                  [Boolean]
#                                  Turn on/off gpg check in repo files (effective only on RedHat family systems)
#                                  group: Advanced parameters
#
# @param version                   [String]
#                                  Foreman package version, it's passed to ensure parameter of package resource
#                                  can be set to specific version number, 'latest', 'present' etc.
#                                  group: Advanced parameters
#
# @param plugin_version            [String]
#                                  Foreman plugins package version, it's passed to ensure parameter of package resource
#                                  can be set to 'installed', 'latest', 'present' only
#                                  group: Advanced parameters
#
# @param db_adapter                [Optional[Enum['mysql2', 'postgresql', 'sqlite3']]]
#                                  Database 'production' adapter
#                                  group: Advanced parameters
#
# @param db_host                   [Optional[String]]
#                                  Database 'production' host
#                                  group: Advanced parameters
#
# @param db_port                   [Optional[Integer[0, 65635]]]
#                                  Database 'production' port
#                                  group: Advanced parameters
#
# @param db_database               [Optional[String]]
#                                  Database 'production' database (e.g. foreman)
#                                  group: Advanced parameters
#
# @param db_username               [Optional[String]]
#                                  Database 'production' user (e.g. foreman)
#                                  group: Advanced parameters
#
# @param db_password               [Optional[String]]
#                                  Database 'production' password, default is randomly generated
#                                  group: Advanced parameters
#
# @param db_sslmode                [Optional[String]]
#                                  Database 'production' ssl mode
#                                  group: Advanced parameters
#
# @param db_pool                   [Integer[0]]
#                                  Database 'production' size of connection pool
#                                  group: Advanced parameters
#
# @param db_manage_rake            [Boolean]
#                                  if enabled, will run rake jobs, which depend on the database
#                                  group: Advanced parameters
#
# @param app_root                  [Stdlib::Absolutepath]
#                                  Name of foreman root directory
#                                  group: Advanced parameters
#
# @param manage_user               [Boolean]
#                                  Controls whether foreman module will manage the user on the system.
#                                  group: Advanced parameters
#
# @param user                      [String]
#                                  User under which foreman will run
#                                  group: Advanced parameters
#
# @param group                     [String]
#                                  Primary group for the Foreman user
#                                  group: Advanced parameters
#
# @param rails_env                 [String]
#                                  Rails environment of foreman
#                                  group: Advanced parameters
#
# @param user_groups               [Array[String]]
#                                  Additional groups for the Foreman user
#                                  group: Advanced parameters
#
# @param puppet_home               [Stdlib::Absolutepath]
#                                  Puppet home directory
#                                  group: Advanced parameters
#
# @param puppet_ssldir             [Stdlib::Absolutepath]
#                                  Puppet SSL directory
#                                  group: Advanced parameters
#
# @param passenger_interface       [Optional[String]]
#                                  Defines which network interface passenger should listen on, undef means all interfaces
#                                  group: Advanced parameters
#
# @param passenger_prestart        [Boolean]
#                                  Pre-start the first passenger worker instance process during httpd start.
#                                  group: Advanced parameters
#
# @param passenger_min_instances   [Integer[0]]
#                                  Minimum passenger worker instances to keep when application is idle.
#                                  group: Advanced parameters
#
# @param passenger_start_timeout   [Integer[0]]
#                                  Amount of seconds to wait for Ruby application boot.
#                                  group: Advanced parameters
#
# @param vhost_priority            [String]
#                                  Defines Apache vhost priority for the Foreman vhost conf file.
#                                  group: Advanced parameters
#
# @param server_port               [Integer[0, 65535]]
#                                  Defines Apache port for HTTP requests
#                                  group: Advanced parameters
#
# @param server_ssl_port           [Integer[0, 65535]]
#                                  Defines Apache port for HTTPS reqquests
#                                  group: Advanced parameters
#
# @param server_ssl_ca             [Stdlib::Absolutepath]
#                                  Defines Apache mod_ssl SSLCACertificateFile setting in Foreman vhost conf file.
#                                  group: Advanced parameters
#
# @param server_ssl_chain          [Stdlib::Absolutepath]
#                                  Defines Apache mod_ssl SSLCertificateChainFile setting in Foreman vhost conf file.
#                                  group: Advanced parameters
#
# @param server_ssl_cert           [Stdlib::Absolutepath]
#                                  Defines Apache mod_ssl SSLCertificateFile setting in Foreman vhost conf file.
#                                  group: Advanced parameters
#
# @param server_ssl_certs_dir      [Variant[String[0], Stdlib::Absolutepath]]
#                                  Defines Apache mod_ssl SSLCACertificatePath setting in Foreman vhost conf file.
#                                  group: Advanced parameters
#
# @param server_ssl_key            [Stdlib::Absolutepath]
#                                  Defines Apache mod_ssl SSLCertificateKeyFile setting in Foreman vhost conf file.
#                                  group: Advanced parameters
#
# @param server_ssl_crl            [Optional[Variant[String[0], Stdlib::Absolutepath]]]
#                                  Defines the Apache mod_ssl SSLCARevocationFile setting in Foreman vhost conf file.
#                                  group: Advanced parameters
#
# @param client_ssl_ca             [Stdlib::Absolutepath]
#                                  Defines the SSL CA used to communicate with Foreman Proxies
#                                  group: Advanced parameters
#
# @param client_ssl_cert           [Stdlib::Absolutepath]
#                                  Defines the SSL certificate used to communicate with Foreman Proxies
#                                  group: Advanced parameters
#
# @param client_ssl_key            [Stdlib::Absolutepath]
#                                  Defines the SSL private key used to communicate with Foreman Proxies
#                                  group: Advanced parameters
#
# @param keepalive                 [Boolean]
#                                  Enable KeepAlive setting of Apache?
#                                  group: Advanced parameters
#
# @param max_keepalive_requests    [Integer[0]]
#                                  MaxKeepAliveRequests setting of Apache
#                                  (Number of requests allowed on a persistent connection)
#                                  group: Advanced parameters
#
# @param keepalive_timeout         [Integer[0]]
#                                  KeepAliveTimeout setting of Apache
#                                  (Seconds the server will wait for subsequent requests on a persistent connection)
#                                  group: Advanced parameters
#
# @param oauth_active              [Boolean]
#                                  Enable OAuth authentication for REST API
#                                  group: Advanced parameters
#
# @param oauth_map_users           [Boolean]
#                                  Should Foreman use the foreman_user header to identify API user?
#                                  group: Advanced parameters
#
# @param oauth_consumer_key        [String]
#                                  OAuth consumer key
#                                  group: Advanced parameters
#
# @param oauth_consumer_secret     [String]
#                                  OAuth consumer secret
#                                  group: Advanced parameters
#
# @param http_keytab               [Stdlib::Absolutepath]
#                                  Path to keytab to be used for Kerberos authentication on the WebUI
#                                  group: Advanced parameters
#
# @param pam_service               [String]
#                                  PAM service used for host-based access control in IPA
#                                  group: Advanced parameters
#
# @param ipa_manage_sssd           [Boolean]
#                                  If ipa_authentication is true, should the installer manage SSSD? You can disable it
#                                  if you use another module for SSSD configuration
#                                  group: Advanced parameters
#
# @param websockets_encrypt        [Boolean]
#                                  Whether to encrypt websocket connections
#                                  group: Advanced parameters
#
# @param websockets_ssl_key        [Stdlib::Absolutepath]
#                                  SSL key file to use when encrypting websocket connections
#                                  group: Advanced parameters
#
# @param websockets_ssl_cert       [Stdlib::Absolutepath]
#                                  SSL certificate file to use when encrypting websocket connections
#                                  group: Advanced parameters
#
# @param logging_level             [Enum['debug', 'info', 'warn', 'error', 'fatal']]
#                                  Logging level of the Foreman application
#                                  group: Advanced parameters
#
# @param loggers                   [Hash[String, Boolean]]
#                                  Enable or disable specific loggers, e.g. {"sql" => true}
#                                  group: Advanced parameters
#
# @param email_config_method       [Enum['database', 'file']]
#                                  Configure email settings in database (1.14+) or configuration file (deprecated)
#                                  group: Advanced parameters
#
# @param email_conf                [String]
#                                  Email configuration file under /etc/foreman
#                                  group: Advanced parameters
#
class foreman (
  $foreman_url               = $::foreman::params::foreman_url,
  $puppetrun                 = $::foreman::params::puppetrun,
  $unattended                = $::foreman::params::unattended,
  $authentication            = $::foreman::params::authentication,
  $passenger                 = $::foreman::params::passenger,
  $passenger_ruby            = $::foreman::params::passenger_ruby,
  $passenger_ruby_package    = $::foreman::params::passenger_ruby_package,
  $plugin_prefix             = $::foreman::params::plugin_prefix,
  $use_vhost                 = $::foreman::params::use_vhost,
  $servername                = $::foreman::params::servername,
  $serveraliases             = $::foreman::params::serveraliases,
  $ssl                       = $::foreman::params::ssl,
  $custom_repo               = $::foreman::params::custom_repo,
  $repo                      = $::foreman::params::repo,
  $configure_epel_repo       = $::foreman::params::configure_epel_repo,
  $configure_scl_repo        = $::foreman::params::configure_scl_repo,
  $selinux                   = $::foreman::params::selinux,
  $gpgcheck                  = $::foreman::params::gpgcheck,
  $version                   = $::foreman::params::version,
  $plugin_version            = $::foreman::params::plugin_version,
  $db_manage                 = $::foreman::params::db_manage,
  $db_type                   = $::foreman::params::db_type,
  $db_adapter                = 'UNSET',
  $db_host                   = 'UNSET',
  $db_port                   = 'UNSET',
  $db_database               = 'UNSET',
  $db_username               = $::foreman::params::db_username,
  $db_password               = $::foreman::params::db_password,
  $db_sslmode                = 'UNSET',
  $db_pool                   = $::foreman::params::db_pool,
  $db_manage_rake            = $::foreman::params::db_manage_rake,
  $app_root                  = $::foreman::params::app_root,
  $manage_user               = $::foreman::params::manage_user,
  $user                      = $::foreman::params::user,
  $group                     = $::foreman::params::group,
  $user_groups               = $::foreman::params::user_groups,
  $rails_env                 = $::foreman::params::rails_env,
  $puppet_home               = $::foreman::params::puppet_home,
  $puppet_ssldir             = $::foreman::params::puppet_ssldir,
  $locations_enabled         = $::foreman::params::locations_enabled,
  $organizations_enabled     = $::foreman::params::organizations_enabled,
  $passenger_interface       = $::foreman::params::passenger_interface,
  $vhost_priority            = $::foreman::params::vhost_priority,
  $server_port               = $::foreman::params::server_port,
  $server_ssl_port           = $::foreman::params::server_ssl_port,
  $server_ssl_ca             = $::foreman::params::server_ssl_ca,
  $server_ssl_chain          = $::foreman::params::server_ssl_chain,
  $server_ssl_cert           = $::foreman::params::server_ssl_cert,
  $server_ssl_certs_dir      = $::foreman::params::server_ssl_certs_dir,
  $server_ssl_key            = $::foreman::params::server_ssl_key,
  $server_ssl_crl            = $::foreman::params::server_ssl_crl,
  $client_ssl_ca             = $::foreman::params::server_ssl_ca,
  $client_ssl_cert           = $::foreman::params::server_ssl_cert,
  $client_ssl_key            = $::foreman::params::server_ssl_key,
  $keepalive                 = $::foreman::params::keepalive,
  $max_keepalive_requests    = $::foreman::params::max_keepalive_requests,
  $keepalive_timeout         = $::foreman::params::keepalive_timeout,
  $oauth_active              = $::foreman::params::oauth_active,
  $oauth_map_users           = $::foreman::params::oauth_map_users,
  $oauth_consumer_key        = $::foreman::params::oauth_consumer_key,
  $oauth_consumer_secret     = $::foreman::params::oauth_consumer_secret,
  $passenger_prestart        = $::foreman::params::passenger_prestart,
  $passenger_min_instances   = $::foreman::params::passenger_min_instances,
  $passenger_start_timeout   = $::foreman::params::passenger_start_timeout,
  $admin_username            = $::foreman::params::admin_username,
  $admin_password            = $::foreman::params::admin_password,
  $admin_first_name          = $::foreman::params::admin_first_name,
  $admin_last_name           = $::foreman::params::admin_last_name,
  $admin_email               = $::foreman::params::admin_email,
  $initial_organization      = $::foreman::params::initial_organization,
  $initial_location          = $::foreman::params::initial_location,
  $ipa_authentication        = $::foreman::params::ipa_authentication,
  $http_keytab               = $::foreman::params::http_keytab,
  $pam_service               = $::foreman::params::pam_service,
  $ipa_manage_sssd           = $::foreman::params::ipa_manage_sssd,
  $websockets_encrypt        = $::foreman::params::websockets_encrypt,
  $websockets_ssl_key        = $::foreman::params::websockets_ssl_key,
  $websockets_ssl_cert       = $::foreman::params::websockets_ssl_cert,
  $logging_level             = $::foreman::params::logging_level,
  $loggers                   = $::foreman::params::loggers,
  $email_config_method       = $::foreman::params::email_config_method,
  $email_conf                = $::foreman::params::email_conf,
  $email_source              = $::foreman::params::email_source,
  $email_delivery_method     = $::foreman::params::email_delivery_method,
  $email_smtp_address        = $::foreman::params::email_smtp_address,
  $email_smtp_port           = $::foreman::params::email_smtp_port,
  $email_smtp_domain         = $::foreman::params::email_smtp_domain,
  $email_smtp_authentication = $::foreman::params::email_smtp_authentication,
  $email_smtp_user_name      = $::foreman::params::email_smtp_user_name,
  $email_smtp_password       = $::foreman::params::email_smtp_password,
) inherits foreman::params {
  if $db_adapter == 'UNSET' {
    $db_adapter_real = $::foreman::db_type ? {
      'sqlite' => 'sqlite3',
      'mysql'  => 'mysql2',
      default  => $::foreman::db_type,
    }
  } else {
    $db_adapter_real = $db_adapter
  }
  validate_bool($passenger)
  if $passenger == false and $ipa_authentication {
    fail("${::hostname}: External authentication via IPA can only be enabled when passenger is used.")
  }
  validate_bool($websockets_encrypt)
  validate_re($logging_level, '^(debug|info|warn|error|fatal)$')
  validate_re($plugin_version, '^(installed|present|latest)$')
  validate_hash($loggers)
  validate_array($serveraliases)
  validate_re($email_config_method, '^(database|file)$')
  if $email_delivery_method {
    validate_re($email_delivery_method, ['^sendmail$', '^smtp$'], "email_delivery_method can be either sendmail or smtp, not ${email_delivery_method}")
  }
  validate_bool($puppetrun)

  include ::foreman::repo

  Class['foreman::repo'] ~>
  class { '::foreman::install': } ~>
  class { '::foreman::config': } ~>
  class { '::foreman::database': } ~>
  class { '::foreman::service': } ->
  Class['foreman'] ->
  Foreman_smartproxy <| base_url == $foreman_url |>

  # When db_manage and db_manage_rake are false, this extra relationship is required.
  Class['foreman::config'] ~> Class['foreman::service']

  # Anchor these separately so as not to break
  # the notify between main classes
  Class['foreman::install'] ~>
  Package <| tag == 'foreman-compute' |> ~>
  Class['foreman::service']

  Class['foreman::repo'] ~>
  Package <| tag == 'foreman::cli' |> ~>
  Class['foreman']

  Class['foreman::repo'] ~>
  Package <| tag == 'foreman::providers' |> ->
  Class['foreman']

  # lint:ignore:spaceship_operator_without_tag
  Class['foreman::database']~>
  Foreman::Plugin <| |> ~>
  Class['foreman::service']
  # lint:endignore

  contain 'foreman::settings' # lint:ignore:relative_classname_inclusion (PUP-1597)
  Class['foreman::database'] -> Class['foreman::settings']
}
