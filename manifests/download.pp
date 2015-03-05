# == Define: remotefile::download
#
# Download a remote file, if it does not exist or its checksum is out of date.
#
# Intended to function similarly to Chef's remote_file resource.
#
# === Parameters
#
# [*checksum*]
#   SHA256 checksum of file to be downloaded.
#
# [*file_name*]
#   Local name of downloaded file.
#
# [*install_dir*]
#   Local directory for downloaded file.
#
# [*url*]
#   URL where file will be downloaded from; must work with wget.
#
# [*group*]
#   Group ownership of local file.
#
# [*mode*]
#   Mode to set file to after downloading; default: 0444
#
# [*user*]
#   User account to set as owner of local file.
#
# === Examples
#
# remotefile::download { 'bootstrap-librarian-puppet':
#   checksum      => '7e7a47703d5d9770a010601e6a3f49a7a83b230d0985b5ed8db2dd0f912b56f7',
#   checksum_url  => 'https://raw.github.com/anl/bootstrap-linux/24c8fb75e07767df0a98e4af0ffebe776df064a7/bootstrap-librarian-puppet.sha256sum',
#   checksum_type => 'sha256sum',
#   file_name     => 'bootstrap-librarian-puppet',
#   install_dir   => '/tmp',
#   url           => 'https://raw.github.com/anl/bootstrap-linux/24c8fb75e07767df0a98e4af0ffebe776df064a7/bootstrap-librarian-puppet',
# }
#
# === Authors
#
# Andrew Leonard
#
# === Copyright
#
# Copyright 2013 Andrew Leonard
#
define remotefile::download(
  $checksum = '',
  $checksum_url = '',
  $checksum_type = 'sha256sum',
  $file_name,
  $install_dir,
  $url,
  $group = 'root',
  $mode = '0444',
  $user = 'root',
  $owner = 'root',
  ) {

  $file_path = "${install_dir}/${file_name}"
  if $checksum_url != '' {
    $_checksum = generate('/bin/sh', '-c', "/usr/bin/wget -O - -o /dev/null ${checksum_url} | tr -d '\n'")
  }
  else {
    $_checksum = $checksum
  }
  exec { "download ${url}":
    command => "/usr/bin/wget -O ${file_path} ${url} && /bin/chown ${owner}:${group} ${file_path} && /bin/chmod ${mode} ${file_path}",
    user    => $user,
    group   => $group,
    unless  => "/usr/bin/$checksum_type ${file_path} | /bin/grep ${_checksum}",
    require => [Package['wget'], Package[$remotefile::params::checksums_pkg]]
  }
}
