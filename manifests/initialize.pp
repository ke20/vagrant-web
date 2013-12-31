
Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }


exec { 'apt-get update':
    command => 'apt-get update',
}

# -------------------------------------
# Apache installation and configuration
class { "apache": }

apache::module { 'rewrite': }

apache::vhost { 'default':
    docroot     => '/vagrant/projects',
    server_name => false,
    priority    => '',
    template    => 'apache/virtualhost/vhost.conf.erb',
}


# ----------------------------------
# PHP installation and configuration
class { 'php': }

php::module { ["curl", "gd", "imagick", "xdebug"]: }

# Override the PHP configuration
file {'/etc/php5/conf.d/errors.ini':
  ensure => present,
  owner => root, group => root, mode => 444,
  content => "display_errors = On \n",
}


# ------------------------------------
# MySQL installation and configuration
class { 'mysql':
    root_password => 'root'
}


# -----------------------------------------
# phpmyadmin installation and configuration
package { 'phpmyadmin':
    ensure  => latest,
    require  => Exec['apt-get update'],
}

file { '/etc/apache2/conf.d/phpmyadmin.conf':
    ensure  => link,
    target  => '/etc/phpmyadmin/apache.conf',
    require => Package['apache', 'phpmyadmin'],
    notify  => Service["apache2"],
}


# ----------------
# Git installation
package { 'git': }


# ----------------------------------
# Ruby installation with gems
class { 'ruby': }

# Some useful web dev tools
package { ['sass', 'compass']:
    ensure => installed,
    provider => 'gem',
}


# --------------------------------
# Vim installation (can to be useful)
package { 'vim':
    ensure => latest,
    require  => Exec['apt-get update'],
}
