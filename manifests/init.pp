class tomcat (
  $ensure              = 'present',
  $autoupgrade         = false,
  $config_file_replace = true,
  #TODO# support more ports
  $http_port           = 8080,
  $java_opts           = [
    '-Djava.awt.headless=true',
    '-Xmx128m',
    '-XX:+UseConcMarkSweepGC',
  ],
  $java_home           = undef,
  $tomcat_admin        = false,
  $native_libs         = false,
  $package             = $::tomcat::params::package,
  $service_name        = $::tomcat::params::service_name,
  $pid_file            = $::tomcat::params::pid_file,
  $context_home        = $::tomcat::params::context_home,
  $server_xml_file     = $::tomcat::params::service_xml_file,
  $default_java_home   = $::tomcat::params::default_java_home,
  $native_packages     = $::tomcat::params::native_packages,
  $admin_package       = $::tomcat::params::admin_package,
  $config_file         = $::tomcat::params::config_file,
  $config_template     = $::tomcat::params::config_template,
  $user                = $::tomcat::params::user,
  $group               = $::tomcat::params::group,
) inherits tomcat::params {

     class{'tomcat::install': }
  -> class{'tomcat::config': }
  ~> class{'tomcat::service': }
  -> class{'tomcat::external::monit': }
  -> Class['tomcat']

}
