#coding: utf-8
lib = File.expand_path('../lib',__FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include(lib)

Gem::Specification.new do |spec|
  spec.name         = "mygame"
  spec.version      = '1.0'
  spec.authors      =["chrisbrickey"]
  spec.email        =["myemail@yourdomain.com"]
  spec.summary      =%q{simple sinatra web app}
  spec.description  =%q{game includes puzzles to solve and choose-your-own-adventure}
  spec.homepage     ="http://domainforproject.com/"
  spec.license      ="tbd"

  spec.files        =['lib/mygame.rb']
  spec.executables  =['bin/mygame']
  spec.test_files   =['tests/mygame.rb']
  spec.require_paths  =["lib"]
end
