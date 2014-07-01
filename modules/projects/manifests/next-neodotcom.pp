class projects::next-neodotcom {

  boxen::project { 'next-neodotcom':
    ruby   => '2.1.0',
    nodejs => 'v0.10.26',
    source => 'neo/next-neo.com'
  }
}
