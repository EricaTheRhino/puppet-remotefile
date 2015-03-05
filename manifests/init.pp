# == Class: remotefile
#
# Installs requirements for remotefile::download define.
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
#  include remotefile
#
# === Authors
#
# Author Andrew Leonard
#
# === Copyright
#
# Copyright 2013 Andrew Leonard, unless otherwise noted.
#
class remotefile inherits remotefile::params {

  ensure_packages([$remotefile::params::checksums_pkg, 'wget'])

}
