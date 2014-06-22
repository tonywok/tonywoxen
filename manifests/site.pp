require boxen::environment
require homebrew
require gcc

Exec {
  group       => 'staff',
  logoutput   => on_failure,
  user        => $boxen_user,

  path => [
    "${boxen::config::home}/rbenv/shims",
    "${boxen::config::home}/rbenv/bin",
    "${boxen::config::home}/rbenv/plugins/ruby-build/bin",
    "${boxen::config::home}/homebrew/bin",
    '/usr/bin',
    '/bin',
    '/usr/sbin',
    '/sbin'
  ],

  environment => [
    "HOMEBREW_CACHE=${homebrew::config::cachedir}",
    "HOME=/Users/${::boxen_user}"
  ]
}

File {
  group => 'staff',
  owner => $boxen_user
}

Package {
  provider => homebrew,
  require  => Class['homebrew']
}

Repository {
  provider => git,
  extra    => [
    '--recurse-submodules'
  ],
  require  => File["${boxen::config::bindir}/boxen-git-credential"],
  config   => {
    'credential.helper' => "${boxen::config::bindir}/boxen-git-credential"
  }
}

Service {
  provider => ghlaunchd
}

Homebrew::Formula <| |> -> Package <| |>

node default {
  # core modules, needed for most things
  include dnsmasq
  include git
  include hub
  include nginx

  # fail if FDE is not enabled
  if $::root_encrypted == 'no' {
    fail('Please enable full disk encryption and try again')
  }

  # node versions
  include nodejs::v0_6
  include nodejs::v0_8
  include nodejs::v0_10

  # default ruby versions
  ruby::version { '1.9.3': }
  ruby::version { '2.0.0': }
  ruby::version { '2.1.0': }
  ruby::version { '2.1.1': }
  ruby::version { '2.1.2': }

  # common, useful packages
  package {
    [
      'ack',
      'findutils',
      'gnu-tar'
    ]:
  }

  # not working:
  #  incude utorrent
  #  include airfoil

  # additional modules
  include macvim
  include hipchat
  include alfred
  include gitx::dev
  include iterm2::dev
  include iterm2::colors::arthur
  include postgresql
  include dropbox
  include dash
  include flux
  include screenhero
  include vlc
  include virtualbox
  include seil
  include keepassx
  include spotify

  # osx preferences
  #
  # track pad / keys
  include osx::global::key_repeat_delay
  include osx::global::key_repeat_rate
  include osx::global::expand_save_dialog
  include osx::global::tap_to_click
  # dock
  include osx::dock::2d
  include osx::dock::autohide
  include osx::dock::clear_dock
  include osx::dock::hide_indicator_lights
  class { "osx::dock::position":
    position => "right"
  }
  # finder
  include osx::finder::empty_trash_securely
  include osx::finder::unhide_library
  include osx::finder::show_hidden_files
  include osx::finder::enable_quicklook_text_selection
  # misc
  include osx::universal_access::ctrl_mod_zoom
  include osx::no_network_dsstores
  include osx::software_update
  osx::recovery_message {
    "If this mac is found, please call/email 3302066008/tonywok@gmail.com":
  }
  osx::dock::hot_corner { 'Show the desktop':
    position => 'Top Left',
    action => 'Desktop'
  }

  file { "${boxen::config::srcdir}/our-boxen":
    ensure => link,
    target => $boxen::config::repodir
  }
}
