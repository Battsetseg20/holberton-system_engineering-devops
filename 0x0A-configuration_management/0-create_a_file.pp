#Using Puppet, create a file in /tmp.

file { 'holberton':
  ensure  => 'present',
  content => 'I love Puppet',
  path    => '/tmp/holberton',
  mode    => '0744',
  owner   => 'www-data',
  group   => 'www-data',
}