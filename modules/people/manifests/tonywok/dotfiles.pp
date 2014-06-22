class people::tonywok::dotfiles {

  $dotfiles = "${boxen::config::srcdir}/dotfiles"
  
  repository { $dotfiles:
    source  => "tonywok/dotfiles",
    require => File["${boxen::config::srcdir}"],
  }

  exec { "Install dotfiles":
    provider => shell,
    command  => './install',
    cwd      => $dotfiles,
    require  => Repository[$dotfiles],
  }

}
