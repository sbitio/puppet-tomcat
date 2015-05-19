class tomcat::config {

  if $caller_module_name != $module_name {
    warning("${name} is not part of the public API of the ${module_name} module and should not be directly included in the manifest.")
  }

  file { $::tomcat::config_file:
    ensure  => $ensure,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    replace => $tomcat::config_file_replace,
    content => template($tomcat::config_file_template),
  }
  file { $::tomcat::server_xml_file:
    ensure  => $ensure,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template("tomcat/${::tomcat::params::tomcat_version}/server.xml.erb"),
  }

}

