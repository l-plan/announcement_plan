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

  s.add_dependency "rails", ">4"
  s.add_dependency "default_value_for", "~> 3.0.0"
  s.add_dependency 'jquery-minicolors-rails'

  # s.add_dependency "apartment", "~> 1"
  # s.add_dependency "devise", "~> 3"

  s.add_development_dependency "mysql2"
  # s.add_development_dependency 'jquery-rails'
  # s.add_development_dependency 'jquery-ui-rails'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'minitest-rails'
  s.add_development_dependency 'minitest-spec-rails'
  s.add_development_dependency "minitest-reporters"
  s.add_development_dependency 'color_pound_spec_reporter'
  # s.add_development_dependency 'foundation-rails'
  s.add_development_dependency 'autoprefixer-rails'
  s.add_development_dependency 'sassc-rails', '~> 2.0.0'
  s.add_development_dependency 'webpacker'

  



end
