class people::tonywok::preferences {
  # track pad / keys
  #
  include osx::global::key_repeat_delay
  include osx::global::key_repeat_rate
  include osx::global::expand_save_dialog
  include osx::global::tap_to_click

  # dock
  #
  include osx::dock::2d
  include osx::dock::autohide
  include osx::dock::clear_dock
  include osx::dock::hide_indicator_lights
  class { "osx::dock::position":
    position => "right"
  }

  # finder
  #
  include osx::finder::empty_trash_securely
  include osx::finder::unhide_library
  include osx::finder::show_hidden_files
  include osx::finder::enable_quicklook_text_selection

  # misc
  #
  include osx::universal_access::ctrl_mod_zoom
  include osx::no_network_dsstores
  include osx::software_update
  osx::recovery_message { 'If this Mac is found, please call +1.330.206.6008': }
  osx::dock::hot_corner { 'Show the desktop':
    position => 'Top Left',
    action => 'Desktop'
  }
}
