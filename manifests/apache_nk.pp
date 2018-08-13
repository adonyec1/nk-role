class profile::apache ( 
  Boolean $default_vhost = true,
  Hash $apache_vhost_servers,

#  Integer $port = 80,
#  String $docroot = "/var/www/${facts['fqdn']}",
) { 
  class { '::apache':
    default_vhost => $default_vhost
  }

  ::apache::vhost { $facts['fqdn']:
    port    => $port,
    docroot => $docroot,
    before  => File["${docroot}/index.html"],
  }

  file { "${docroot}/index.html": 
  ensure => file,
  content => "Test page. This is a test "
  }
}
