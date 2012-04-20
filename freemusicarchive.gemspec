# -*- encoding: utf-8 -*-
require File.expand_path('../lib/freemusicarchive/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Liane Nakamura"]
  gem.email         = ["idiofox555+github@gmail.com"]
  gem.description   = %q{A ruby wrapper for the Free Music Archive API}
  gem.summary       = %q{The freemusicarchive gem is a wrapper for the Free Music Archive API. It provides simple methods to execute HTTP calls.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "freemusicarchive"
  gem.require_paths = ["lib"]
  gem.version       = FreeMusicArchive::VERSION
  
  gem.add_dependency 'faraday', '~> 0.7'
  gem.add_runtime_dependency('faraday_middleware', '~> 0.8')
  gem.add_runtime_dependency('hashie',  '>= 0.4.0')
  gem.add_runtime_dependency('multi_xml', '~> 0.4.4')
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency('webmock', '~> 1.6')
end
