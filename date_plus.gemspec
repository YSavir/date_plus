# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'date_plus/version'

Gem::Specification.new do |spec|
  spec.name          = "date_plus"
  spec.version       = DatePlus::VERSION
  spec.authors       = ["Yaniv Savir"]
  spec.email         = ["saviry@gmail.com"]
  spec.description   = %q{Additional methods for date objects}
  spec.summary       = %q{Filling in necessary holes and eliminating unnecessary steps in date objects}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
