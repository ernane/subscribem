$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "subscribem/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "subscribem"
  s.version     = Subscribem::VERSION
  s.authors     = ["Ernane Sena"]
  s.email       = ["ernane.sena@gmail.com"]
  s.homepage    = "https://github.com/ernane/subscribem"
  s.summary     = "Summary of Subscribem."
  s.description = "Description of Subscribem."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.13"
  s.add_dependency "bcrypt-ruby", '~> 3.0.1'
  s.add_dependency "warden"
  s.add_dependency "dynamic_form"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara"
end
