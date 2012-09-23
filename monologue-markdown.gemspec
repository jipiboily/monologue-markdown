$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "monologue-markdown/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "monologue-markdown"
  s.version     = MonologueMarkdown::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of MonologueMarkdown."
  s.description = "TODO: Description of MonologueMarkdown."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 3.2.8"
  s.add_dependency "monologue"
  s.add_dependency "deface"
  s.add_dependency "redcarpet"

  s.add_development_dependency "rspec-rails", "~> 2.11"
  s.add_development_dependency 'factory_girl_rails', '~> 4.1.0'
  s.add_development_dependency "capybara"
  s.add_development_dependency "shoulda"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "database_cleaner"
  s.add_development_dependency "mysql2"
end