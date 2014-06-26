class people::tonywok::applications {
  # not working:
  #  incude utorrent
  #  include airfoil
  
  # additional modules
  #
  include macvim
  include hipchat
  include alfred
  include gitx::dev
  include iterm2::dev
  include iterm2::colors::arthur
  include dropbox
  include dash
  include flux
  include screenhero
  include vlc
  include seil
  include keepassx
  include spotify
  include postgresql
  include virtualbox
  include bash
  include bash::completion
  class { 'vagrant': }
}
