$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "supatagu/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "supatagu"
  s.version     = Supatagu::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Supatagu."
  s.description = "TODO: Description of Supatagu."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.0.0.beta1"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
