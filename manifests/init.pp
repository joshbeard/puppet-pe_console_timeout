# == Class: pe_console_timeout
#
# Adjust the Puppet Enterprise Console (web interface) session timeout
#
# === Parameters
#
# [*timeout_interval*]
#   Session timeout interval, in seconds.  Default: 1200
#
# === Examples
#
#  class { pe_console_timeout:
#    timeout_interval = '3600'
#  }
#
# === Authors
#
# Josh Beard <beard@puppetlabs.com>
#
# === Copyright
#
# Copyright 2014 Puppet Labs
#
class pe_console_timeout (
  $timeout_interval = '1200',
) {

  if (false == $::is_pe) {
    fail("${module_name} only works on Puppet Enterprise")
  }

  validate_re($timeout_interval, '^\d+$', 'timeout_interval must be numbers')

  file_line { 'maximum_session_lifetime':
    ensure => present,
    path   => '/etc/puppetlabs/rubycas-server/config.yml',
    match  => '^maximum_session_lifetime:',
    line   => "maximum_session_lifetime: ${timeout_interval}",
  }

  file_line { 'session_timeout':
    ensure => present,
    path   => '/etc/puppetlabs/console-auth/cas_client_config.yml',
    match  => '  session_timeout:',
    line   => "  session_timeout: ${timeout_interval}",
  }
}
