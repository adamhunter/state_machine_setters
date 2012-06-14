# -*- encoding: utf-8 -*-
require File.expand_path('../lib/state_machine_setters/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Adam Hunter", "Chris Peters"]
  gem.email         = ["adamhunter@me.com", "chrispeters.psu@gmail.com"]
  gem.description   = %q{Adds setter methods based off of state machine transitions to allow triggering state changes from form attributes.}
  gem.summary       = %q{Trigger state machine transitions from setters.}

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "state_machine_setters"
  gem.require_paths = ["lib"]
  gem.version       = StateMachineSetters::VERSION

  gem.add_dependency "state_machine", ">= 1.1.2"
  gem.add_development_dependency "rspec", "~> 2.10.0"
end
