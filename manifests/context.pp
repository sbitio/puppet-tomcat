# == Defined type: tomcat::context
#
# Implement Tomcat's contexts
#
define tomcat::context (
  $content,
  $ensure = $::tomcat::ensure,
) {

  if (!defined(Class['tomcat'])) {
    fail('You must include class tomcat before creating contexts')
  }

  file { "${::tomcat::context_home}/${name}.xml":
    ensure  => $ensure,
    content => $content,
    notify  => Class['tomcat::service'],
  }

}

