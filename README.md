# AnnouncementPlan

This gem offers you control over messages to your users by announcing them on any page of your application. Messages can be specified for selected users, with selected roles or within selected administrations/tenants. Messages will be shown within a timeframe untill a user marks it as read on any devise, this action will be stored server-side. The gem is a mountable rails-engine.



###prerequisites
* current_user

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'announcement_plan'
```

And then execute:

	$ bundle

Or install it yourself as:


	$ gem install announcement_plan



copy the migration-files into your app:


	$ rake announcement_plan:install:migrations


then migrate your database


	$ rake db:migrate



## Usage


what gets included
css
 *= require announcement_plan/application

 js
//= require announcement_plan/application



## Generator





### configuration

you can override the gems defaults by creating an initializer-file in your apps initializers directory. 

default configuration is:

_config/initializers/announcement_plan.rb_

```ruby
	AnnouncementPlan.configure do |config|
  		config.role_omschr = ["superuser", "admin", "gebruiker", "gast", "medewerker", "manager", "accountant"]
  		config.with_tenant = true
  		config.with_role = true
	end
```

### testing

testing a single file:

	$ rake TEST='test/controllers/announcement_plan/announcements_controller_test.rb'



### todo

refactor scope Announcement.unread(user)
