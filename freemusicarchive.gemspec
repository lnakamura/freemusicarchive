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
  gem.version       = Freemusicarchive::VERSION
end
