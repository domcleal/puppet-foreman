# = Foreman Discovery plugin
#
# This class installs discovery plugin and images
#
# === Parameters:
#
# $install_images::  should the installer download and setup discovery images
#                    for you? the average size is few hundreds of MB
#
# $tftp_root::       TFTP root to install image into
#
# $source_url::      source URL to download from
#
# $image_name::      tarball with images
#
class foreman::plugin::discovery (
  Boolean $install_images = $::foreman::plugin::discovery::params::install_images,
  Stdlib::Absolutepath $tftp_root = $::foreman::plugin::discovery::params::tftp_root,
  Stdlib::HTTPUrl $source_url = $::foreman::plugin::discovery::params::source_url,
  String $image_name = $::foreman::plugin::discovery::params::image_name,
) inherits foreman::plugin::discovery::params {
  foreman::plugin {'discovery':
  }

  if $install_images {
    $tftp_root_clean = regsubst($tftp_root, '/$', '')

    foreman::remote_file {"${tftp_root_clean}/boot/${image_name}":
      remote_location => "${source_url}${image_name}",
      mode            => '0644',
    } ~> exec { "untar ${image_name}":
      command => "tar xf ${image_name}",
      path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
      cwd     => "${tftp_root_clean}/boot",
      creates => "${tftp_root_clean}/boot/fdi-image/initrd0.img",
    }
  }
}
