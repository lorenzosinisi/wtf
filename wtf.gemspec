# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wtf/version'

Gem::Specification.new do |spec|
  spec.name          = "wtf-doc"
  spec.version       = Wtf::VERSION
  spec.authors       = ["Lorenzo Sinisi"]
  spec.email         = ["lasslo.net@gmail.com"]

  spec.summary       = %q{Command line utility to add descriptions to folders (.wtf files).}
  spec.description   = %q{Run $ wtf to read/write the documentation of the current folder}
  spec.homepage      = "https://github.com/lorenzosinisi/wtf"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = ["wtf"]
  spec.require_paths = ["lib"]

  spec.add_dependency 'thor', "0.19.1"
  spec.add_dependency 'httparty'

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
