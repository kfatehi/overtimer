# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'overtimer/version'

Gem::Specification.new do |spec|
  spec.name          = "overtimer"
  spec.version       = Overtimer::VERSION
  spec.authors       = ["Keyvan Fatehi"]
  spec.email         = ["keyvan@digitalfilmtree.com"]
  spec.description   = %q{Calculates employee payroll info based on California laws (overtime, doubletime, etc)}
  spec.summary       = %q{calculates overtime based on California law}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard-rspec"
end
