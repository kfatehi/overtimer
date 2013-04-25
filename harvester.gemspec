# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'harvester/version'

Gem::Specification.new do |spec|
  spec.name          = "harvester"
  spec.version       = Harvester::VERSION
  spec.authors       = ["Keyvan Fatehi"]
  spec.email         = ["keyvan@digitalfilmtree.com"]
  spec.description   = %q{Processes information from Harvest}
  spec.summary       = %q{Pepare timesheets from Harvest data}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "harvested"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard-rspec"
end
