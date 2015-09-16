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






## Generator





### configuration

you can override the gems defaults by creating an initializer-file in your apps initializers directory. 