class people::tonywok::applications {
  # not working:
  #  incude utorrent
  #  include airfoil
  
  # Dev
  #
  include macvim
  include gitx::dev
  include iterm2::dev
  include iterm2::colors::arthur
  include dash
  include screenhero
  include postgresql
  include virtualbox
  include bash
  include bash::completion
  class { 'vagrant': }
  include qt
  include skype
  include java
  include tunnelblick
  include foreman
  include phantomjs
  include redis
  include hub
  include heroku
  include imagemagick
  include ctags
  include chrome

  # Productivity
  #
  include hipchat
  include alfred
  include dropbox
  include flux
  include vlc
  include keepassx
  include flux
  include googledrive
  include caffeine
  include sizeup

  include seil
  include seil::login_item
  seil::bind { 'keyboard bindings':
    mappings => { 'capslock' => 36 }
  }

  # Entertainment
  #
  include spotify
}
