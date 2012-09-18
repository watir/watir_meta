# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
$:.push File.expand_path("../../watir/lib", __FILE__)
require "watir/version"

Gem::Specification.new do |s|
  s.name = "commonwatir"
  s.version = "4.0.0"
  s.platform = Gem::Platform::RUBY
  s.authors = ["Bret Pettichord"]
  s.email = ["bret@pettichord.com"]
  s.homepage = "http://github.com/watir/watir"
  s.summary = %q{Common library for Watir}
  s.description = %q{This library is included so older versions of commonwatir are not activated}
  s.rubyforge_project = "watir"
  s.files = %x{git ls-files}.split("\n")
  s.require_paths = ["lib"]
end
