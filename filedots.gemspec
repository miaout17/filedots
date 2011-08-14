# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "filedots/version"

Gem::Specification.new do |s|
  s.name        = "filedots"
  s.version     = Filedots::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["miaout17"]
  s.email       = ["miaout17@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{A simple dotfiles installation tool}
  s.description = %q{A simple dotfiles installation tool}

  s.rubyforge_project = "filedots"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "thor", ">= 0.14.6"

  s.add_development_dependency 'cucumber', '~> 1.0.2'
  s.add_development_dependency 'aruba', '~> 0.4.6'
  s.add_development_dependency 'rspec', '~> 2.6.0'
end
