# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rexl/version'

Gem::Specification.new do |spec|
  spec.name          = "rexl"
  spec.version       = Rexl::VERSION
  spec.authors       = ["Anton Ovchinnikov"]
  spec.email         = ["revolver112@gmail.com"]
  spec.description   = %q{Ruby extended library, for internal usage}
  spec.summary       = %q{Ruby extended library}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
end
