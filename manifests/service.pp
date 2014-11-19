class tomcat::service () {

  service { $::tomcat::service_name:
    name       => $::tomcat::service_name,
    ensure     => running,
    hasstatus  => true,
    hasrestart => true,
    enable     => true,
    require    => Class['tomcat::config'],
  }

}
