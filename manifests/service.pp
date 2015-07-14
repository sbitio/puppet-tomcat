# == Class: tomcat::service
#
# This class manages tomcat's service daemon.
#
class tomcat::service {

  if $caller_module_name != $module_name {
    warning("${name} is not part of the public API of the ${module_name} module and should not be directly included in the manifest.")
  }

  service { $::tomcat::service_name:
    ensure     => running,
    name       => $::tomcat::service_name,
    hasstatus  => true,
    hasrestart => true,
    enable     => true,
  }

}

