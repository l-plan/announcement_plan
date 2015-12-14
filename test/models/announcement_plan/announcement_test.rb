require 'test_helper'
require 'minitest/autorun'
require 'pry'


module AnnouncementPlan
  class AnnouncementTest < ActiveSupport::TestCase


  	setup do
      @announcement = announcement_plan_announcements(:announcement_1)
      @user = ::User.first
        AnnouncementPlan.configure do |config|
          # config.role_omschr = ["naam"]
          config.with_tenant = true
          config.with_role = true
        end

    end

    

    test "current amount in testset-no-time" do
      Time.stub :now, Time.new(2014,9,16) do 
        Announcement.current.size.must_equal 0
      end
    end

    test "current amount in testset-with-time" do
      Time.stub :now, Time.new(2014,9,16) do 
        Announcement.current( Time.new(2015,9,17) ).size.must_equal 8
      end

    end

    test "amount announcements which are read" do
     Announcement.read(@user).size.must_equal 1
    end

    # test "amount announcements which are not read" do
    #  Announcement.unread(@user).size.must_equal 7
    # end

    test "amount of users for announcement #1" do
     @announcement.users.size.must_equal 3
    end

    test "amount of announcements for user #1 as just an user" do

      @announcement.class.as_user(@user).size.must_equal 3
    end

    test "amount of announcements for user #1 as an user with a role" do
      #user 1 is a employee. there are 2 announcements for employees
      @announcement.class.as_role(@user).size.must_equal 0
    end

    test "amount of announcements for user #1 as an user within a tenant" do
      #user 1 is in tenant #1 there are 2 announcements for users of this tenant
      @announcement.class.as_tenant(@user).size.must_equal 2
    end

    test "amount of announcements for user #1 as an user within a tenant, as an user or wiht his role" do
      #user 1 is in tenant #1 there are 2 announcements for users of this tenant
  
      @announcement.class.for_user(@user, Date.new(2015,9,20)).size.must_equal 3
  
    end

  end
end
