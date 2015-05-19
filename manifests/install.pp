class tomcat::install {

  if $caller_module_name != $module_name {
    warning("${name} is not part of the public API of the ${module_name} module and should not be directly included in the manifest.")
  }

  case $::tomcat::ensure {
    /(present)/: {
      if $::tomcat::autoupgrade == true {
        $package_ensure = 'latest'
      } else {
        $package_ensure = 'present'
      }
    }
    /(absent)/: {
      $package_ensure = 'absent'
    }
    default: {
      fail('ensure parameter must be present or absent')
    }
  }

  if $::tomcat::native_libs {
    package { $::tomcat::native_packages:
      ensure => $package_ensure,
      before => Package[$::tomcat::package],
    }
  }

  package { $::tomcat::package:
    ensure => $package_ensure,
  }

  if $::tomcat::tomcat_admin {
     package { $::tomcat::admin_package:
      ensure  => $package_ensure,
      require => Package[$::tomcat::package],
    }
  }

}

