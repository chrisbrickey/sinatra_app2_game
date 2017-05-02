#coding: utf-8
lib = File.expand_path('../lib',__FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include(lib)

Gem::Specification.new do |spec|
  spec.name         = "game"
  spec.version      = '1.0'
  spec.authors      =["chrisbrickey"]
  spec.email        =["myemail@yourdomain.com"]
  spec.summary      =%q{Short summary of your project}
  spec.description  =%q{Longer description of your project.}
  spec.homepage     ="http://domainforproject.com/"
  spec.license      ="something"

  spec.files        =['lib/game.rb'] #currently not using this
  spec.executables  =['bin/game.rb']
  spec.test_files   =['tests/test_game.rb']
  spec.require_paths  =["lib"]
end
