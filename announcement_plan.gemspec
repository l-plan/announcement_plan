$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "announcement_plan/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "announcement_plan"
  s.version     = AnnouncementPlan::VERSION
  s.authors     = ["rolf"]
  s.email       = ["rolf@l-plan.nl"]
  s.homepage    = "http://www.l-plan.nl"
  s.summary     = "add side-wide announcements for selected users, roles and tenants."
  s.description = "add side-wide announcements for selected users, roles and tenants."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4"
  s.add_dependency "apartment", "~> 1"
  s.add_dependency "devise", "~> 3"

  s.add_development_dependency "mysql2", "0.3.18"
  s.add_development_dependency 'pry'
end
