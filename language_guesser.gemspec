# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'language_guesser/version'

Gem::Specification.new do |gem|
  gem.name          = "language_guesser"
  gem.version       = LanguageGuesser::VERSION
  gem.authors       = ["Elle Meredith"]
  gem.email         = ["ellemeredith@gmail.com"]
  gem.description   = %q{Guess a language}
  gem.summary       = %q{Guess a language}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'awesome_print'
  gem.add_development_dependency 'rb-fsevent'
  gem.add_development_dependency 'guard'
  gem.add_development_dependency 'guard-minitest'
  gem.add_development_dependency 'debugger'
  gem.add_development_dependency 'minitest-reporters'
end
