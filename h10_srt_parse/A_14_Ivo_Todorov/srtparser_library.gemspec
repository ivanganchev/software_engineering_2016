# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'srtparser_library/version'

Gem::Specification.new do |spec|
	spec.name          = "srtparser_library"
	spec.version       = SrtparserLibrary::VERSION
	spec.authors       = ["Ivo Todorov"]
	spec.email         = ["ivo.tod.todorov@gmail.com"]

	spec.summary       = "A library for parsing an SRT file and retrieving various data from it"
	spec.license       = "MIT"

	spec.files         = `git ls-files -z`.split("\x0").reject do |f|
	f.match(%r{^(test|spec|features)/})
	end
	spec.bindir        = "exe"
	spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
	spec.require_paths = ["lib"]

	spec.add_development_dependency "bundler", "~> 1.13"
	spec.add_development_dependency "rake", "~> 10.0"
end
