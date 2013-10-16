# == Class: remotefile::params
#
# Remotefile class parameters.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Examples
#
#
#
# === Authors
#
# Andrew Leonard
#
# === Copyright
#
# Copyright 2013 Andrew Leonard
#
class remotefile::params {

  case $::operatingsystem {
    ubuntu: {
      $shasum_pkg = 'perl'
    }
    default: {
      fail("${operatingsystem} not supported.")
    }
  }
}
