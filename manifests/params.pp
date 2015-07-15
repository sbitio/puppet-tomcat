# == Class: tomcat::params
#
# This class configures tomcat params based on the operating system.
#
class tomcat::params (
  $version = $::tomcat::version::default,
) inherits ::tomcat::version {

  $tomcat_version       = "tomcat${version}"
  $pid_file             = "/var/run/${tomcat_version}.pid"
  $context_home         = "/etc/${tomcat_version}/Catalina/localhost"
  $config_file_template = "tomcat/${::osfamily}/${::tomcat::params::tomcat_version}/default.erb"

  case $::osfamily {
    'Debian': {
      $package           = $tomcat_version
      $service_name      = $tomcat_version
      $default_java_home = '/usr/lib/jvm/default-java'
      $native_packages   = [
        'libapr1',
        'libtcnative-1',
      ]
      $admin_package     = "${tomcat_version}-admin"
      $config_file       = "/etc/default/${tomcat_version}"
      $server_xml_file   = "/etc/${tomcat_version}/server.xml"
      $user              = $tomcat_version
      $group             = $tomcat_version
    }
    'RedHat': {
      $redhat_base_name = $::lsbmajdistrelease ? {
        '6'     => 'tomcat6',
        default => 'tomcat',
      }
      $package           = [
        $redhat_base_name,
        "${redhat_base_name}-webapps",
      ]
      $service_name      = $redhat_base_name
      $default_java_home = '/usr/lib/jvm/jre/'
      $native_packages   = 'tomcat-native'
      $admin_package     = "${redhat_base_name}-admin-webapps"
      $config_file       = "/etc/sysconfig/${redhat_base_name}"
      $server_xml_file   = "/etc/${redhat_base_name}/server.xml"
      $user              = 'tomcat'
      $group             = 'tomcat'
    }
    default: {
      fail("Unsupported osfamily: ${::osfamily} operatingsystem: ${::operatingsystem}, module ${module_name} only support osfamily Debian and RedHat")
    }
  }

}

