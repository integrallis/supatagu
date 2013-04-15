$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "supatagu/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "supatagu"
  s.version     = Supatagu::VERSION
  s.authors     = ["Brian Sam-Bodden"]
  s.email       = ["bsbodden@integrallis.com"]
  s.homepage    = "https://github.com/integrallis/supatagu"
  s.summary     = "A Simple Tagging/Folksonomy Plugin for Rails 4."
  s.description = "A Simple Tagging/Folksonomy Plugin for Rails 4."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.0.0.beta1"
  
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "sqlite3"
end
