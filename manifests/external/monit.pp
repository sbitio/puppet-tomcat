class tomcat::external::monit (
  $ensure  = $::tomcat::ensure,
  $enabled = true,
) {

  if $enabled and defined('::monit') {

    # TODO ensure monit class provider

    $bin = $::tomcat::java_home ? {
      undef   => "${::tomcat::default_java_home}/bin/java",
      default => "${::tomcat::java_home}/bin/java",
    }

    $connection_test = {
      type     => 'connection',
      protocol => 'http',
      port     => $::tomcat::http_port,
      action   => 'restart',
    }

    monit::check::service { $::tomcat::service_name :
      pidfile => $::tomcat::pid_file,
      binary  => $bin,
      tests   => [ $connection_test ],
      require => Class['::tomcat::service'],
    }
  }
}

