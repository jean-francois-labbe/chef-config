# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'chef_json/version'

Gem::Specification.new do |spec|
  spec.name          = "chef_json"
  spec.version       = ChefJson::VERSION
  spec.authors       = ["jean-francois labbé"]
  spec.email         = ["jefff35@gmail.com"]

  spec.summary       = %q{Chef_json generates json configuration from cookbook attributes.}
  spec.description   = %q{Chef_json generates json configuration from cookbook attributes.}
  spec.homepage      = "http://github.com/jefff35/chef_json"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = ['chef_json'] # spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 11.2.2"
  spec.add_development_dependency "minitest", "~> 5.9.0"
  spec.add_development_dependency "guard", "~> 2.14.0"
  spec.add_development_dependency "guard-minitest", "~> 2.4.5"
  spec.add_development_dependency "sass"
end
