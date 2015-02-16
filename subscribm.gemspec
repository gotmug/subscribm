$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "subscribm/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "subscribm"
  s.version     = Subscribm::VERSION
  s.authors     = ["Nick Fisikelli
"]
  s.email       = ["nick@dlabsoftware.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Subscribm."
  s.description = "TODO: Description of Subscribm."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.0"

  
  s.add_development_dependency "rspec-rails", "3.0.1"
  s.add_development_dependency "capybara", "2.3.0"
  
  s.add_dependency "bcrypt",  "3.1.7"
  s.add_dependency "warden", "1.2.3"
  s.add_dependency "dynamic_form", "1.1.4"
  s.add_dependency "factory_girl", "4.4.0"
  s.add_dependency "pg"
  s.add_dependency "apartment"
  
end
