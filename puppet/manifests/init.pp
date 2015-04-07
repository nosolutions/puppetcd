Package {
  allow_virtual => false,
}

class puppetcd {

  exec { 'devtools':
    unless  => '/usr/bin/yum grouplist "Development tools" | /bin/grep "^Installed Groups"',
    command => '/usr/bin/yum -y groupinstall "Development tools"',
  } ->
  class { 'rvm':
    system_users  => ['vagrant'],
  } ->
  rvm_system_ruby { 'ruby-2.1.5':
    ensure => present,
    default_use => true,
  }

  rvm_gemset {
    'ruby-2.1.5@puppetcd':
      ensure  => present,
      require => Rvm_system_ruby['ruby-2.1.5'];
  }

  package { 'sqlite-devel':
    ensure => 'installed',
  }

  package { 'nodejs':
    ensure => 'installed',
  }
}

include puppetcd
