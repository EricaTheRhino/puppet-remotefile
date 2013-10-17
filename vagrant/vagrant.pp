# Include this module
include remotefile

remotefile::download { 'bootstrap-librarian-puppet':
  checksum    => '7e7a47703d5d9770a010601e6a3f49a7a83b230d0985b5ed8db2dd0f912b56f7',
  file_name   => 'bootstrap-librarian-puppet',
  install_dir => '/tmp',
  url         => 'https://raw.github.com/anl/bootstrap-linux/24c8fb75e07767df0a98e4af0ffebe776df064a7/bootstrap-librarian-puppet',
}
