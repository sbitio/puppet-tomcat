class tomcat::config () {

  file { $tomcat::config_file:
    ensure  => $ensure,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    replace => $tomcat::config_file_replace,
    content => template($tomcat::config_template),
    require => Class['tomcat::install'],
  }
  file { $tomcat::server_xml_file:
    ensure  => $ensure,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('tomcat/server.xml.erb'),
    require => Class['tomcat::install'],
  }

}
