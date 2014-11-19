define tomcat::context (
  $content,
  $ensure = $::tomcat::ensure,
) {

  file { "${::tomcat::context_home}/${name}.xml":
    ensure  => $ensure,
    content => $content,
    require => Class['::tomcat::config'],
    notify  => Class['::tomcat::service'],
  }

}

