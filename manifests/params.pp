class tomcat::params (
) {

  # TODO: add support for tomcat versions
  $service_name    = 'tomcat6'
  $pid_file        = '/var/run/tomcat6.pid'
  $context_home    = '/etc/tomcat6/Catalina/localhost'
  $server_xml_file = '/etc/tomcat6/server.xml'

  case $::operatingsystem {
    ubuntu, debian: {
      $package           = 'tomcat6'
      $default_java_home = '/usr/lib/jvm/default-java'
      $native_packages   = [
        'libapr1',
        'libtcnative-1',
      ]
      $admin_package     = 'tomcat6-admin'
      $config_file       = '/etc/default/tomcat6'
      $config_template   = 'tomcat/default.debian.erb'
      #Needed?      $data_dir        = '/var/lib/tomcat6/data'
      $user              = 'tomcat6'
      $group             = 'tomcat6'
    }
    redhat, centos: {
      $package           = [
        'tomcat6',
        'tomcat6-webapps',
      ]
      $default_java_home = '/usr/lib/jvm/jre/'
      $native_packages   = 'tomcat-native'
      $admin_package     = 'tomcat6-admin-webapps'
      $config_file       = '/etc/sysconfig/tomcat6'
      $config_template   = 'tomcat/default.redhat.erb'
      $user              = 'tomcat'
      $group             = 'tomcat'
    }
    default: {
      fail("Unsupported platform: ${::operatingsystem}")
    }
  }

}
