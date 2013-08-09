# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'global_weather/version'

Gem::Specification.new do |spec|
  spec.name          = "global_weather"
  spec.version       = GlobalWeather::VERSION
  spec.authors       = ["Goran Ojkic"]
  spec.email         = ["gojkic@gmail.com"]
  spec.description   = %q{GlobalWeather gem}
  spec.summary       = %q{GlobalWeather gem}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_runtime_dependency "savon", "~> 2.3.0"

end
