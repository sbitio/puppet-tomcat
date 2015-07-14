# == Class: tomcat::version
#
# This class chooses a default tomcat version based on the operating system.
# If several version are available, choose always the greater one.
#
class tomcat::version {

  case $::osfamily {
    'Debian': {
      if $::operatingsystem == 'Debian' {
        # Debian version && tomcat packages:
        # - squeeze(6) => tomcat6
        # - wheezy(7)  => tomcat6, tomcat7
        # - jessie(8)  => tomcat7, tomcat8
        # The greater version of Tomcat matches the Debian release version...
        $default = $::lsbmajdistrelease ? {
          '6' => 6,
          '7' => 7,
          '8' => 8,
        }
      }
      elsif $::operatingsystem == 'Ubuntu' {
        # Ubuntu version && tomcat packages:
        # - precise(12) => tomcat6
        # - trusty(14)  => tomcat6, tomcat7
        $default = $::lsbdistcodename ? {
          'precise' => 6,
          'trusty'  => 7,
        }
      }
      else {
        fail("Unsupported OS: ${::operatingsystem}")
      }
    }
    'RedHat': {
      if $::operatingsystem == 'CentOS' {
        # CentOS version && tomcat packages:
        # - 6 => tomcat6
        # - 7 => tomcat (7)
        $default = $::lsbmajdistrelease ? {
          '6' => 6,
          '7' => 7,
        }
      }
    }
    default: {
      fail("Unsupported osfamily: ${::osfamily} operatingsystem: ${::operatingsystem}, module ${module_name} only support osfamily Debian and RedHat")
    }
  }

}

