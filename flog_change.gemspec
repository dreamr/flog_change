# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'flog_change/version'

Gem::Specification.new do |spec|
  spec.name          = "flog_change"
  spec.version       = FlogChange::VERSION
  spec.authors       = ["Dreamr OKelly"]
  spec.email         = ["dreamr.okelly@gmail.com"]
  spec.description   = %q{Logs flog changes and gives you a graph!}
  spec.summary       = %q{Logs flog changes and gives you a graph!}
  spec.homepage      = ""
  spec.license       = "I could give a shit what you do with this, steal it, fuck it."

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test)/})
  spec.require_paths = ["lib"]
  
  spec.add_dependency "flog", "~> 4.1"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "thincloud-test"
end
