# == Class: tomcat::params
#
# This class configures tomcat params based on the operating system.
#
class tomcat::params (
  $version = $::tomcat::version::default,
) inherits ::tomcat::version {

  case $::osfamily {
    'Debian': {
      $tomcat_name       = "tomcat${version}"
      $package           = $tomcat_name
      $default_java_home = '/usr/lib/jvm/default-java'
      $native_packages   = [
        'libapr1',
        'libtcnative-1',
      ]
      $admin_package     = "${tomcat_name}-admin"
      $config_file       = "/etc/default/${tomcat_name}"
      $user              = $tomcat_name
      $group             = $tomcat_name
    }
    'RedHat': {
      $tomcat_name = $::lsbmajdistrelease ? {
        '6'     => 'tomcat6',
        default => 'tomcat',
      }
      $package           = [
        $tomcat_name,
        "${tomcat_name}-webapps",
      ]
      $default_java_home = '/usr/lib/jvm/jre/'
      $native_packages   = 'tomcat-native'
      $admin_package     = "${tomcat_name}-admin-webapps"
      $config_file       = "/etc/sysconfig/${tomcat_name}"
      $user              = 'tomcat'
      $group             = 'tomcat'
    }
    default: {
      fail("Unsupported osfamily: ${::osfamily} operatingsystem: ${::operatingsystem}, module ${module_name} only support osfamily Debian and RedHat")
    }
  }

  $pid_file             = "/var/run/${tomcat_name}.pid"
  $context_home         = "/etc/${tomcat_name}/Catalina/localhost"
  $config_file_template = "tomcat/${::osfamily}/${::tomcat::params::tomcat_name}/default.erb"
  $service_name         = $tomcat_name
  $server_xml_file      = "/etc/${tomcat_name}/server.xml"

}

