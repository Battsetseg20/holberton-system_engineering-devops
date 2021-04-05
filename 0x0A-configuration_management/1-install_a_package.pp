#Using Puppet, install puppet-m-lint

package { 'puppet-lint':
  ensure   => '2.1.1',
  provider => 'gem',
}