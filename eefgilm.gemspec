# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'eefgilm/version'

Gem::Specification.new do |spec|
  spec.name          = "eefgilm"
  spec.version       = Eefgilm::VERSION
  spec.authors       = ["Erik Nilsen", "Marco Lindsay"]
  spec.email         = ["enilsen16@live.com", "lindsay_marco@hotmail.com"]
  spec.summary       = %q{A gem to keep your Gemfile in best practice .}
  spec.description   = %q{Eefgilm is a gem that is written to help keep your gemfile in order. It will alphabetize your gems, remove comments, and remove unnecessary whitespace.  }
  spec.homepage      = "https://github.com/enilsen16/eefgilm"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "minitest"
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
