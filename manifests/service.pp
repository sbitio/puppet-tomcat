class tomcat::service {

  if $caller_module_name != $module_name {
    warning("${name} is not part of the public API of the ${module_name} module and should not be directly included in the manifest.")
  }

  service { $::tomcat::service_name:
    name       => $::tomcat::service_name,
    ensure     => running,
    hasstatus  => true,
    hasrestart => true,
    enable     => true,
  }

}

