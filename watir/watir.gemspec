# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "watir/version"

Gem::Specification.new do |s|
  s.name = "watir"
  s.version = Watir::BUNDLE_VERSION
  s.platform = Gem::Platform::RUBY
  s.authors = ["Bret Pettichord"]
  s.email = ["bret@pettichord.com"]
  s.homepage = "http://github.com/watir/watir"
  s.summary = %q{Watir}
  s.description = %q{Automated testing tool for web applications. By Testers. For Testers.}
  s.rubyforge_project = "watir"
  s.files = %x{git ls-files}.split("\n")
  s.require_paths = ["lib"]
  s.add_dependency "commonwatir", "~>4"
end
