require 'test_helper'
# require 'pry-rails'
# class AnnouncementPlanConfigurationTest <  ActiveSupport::TestCase

describe AnnouncementPlan::Configuration do

# ActiveSupport::TestCase.fixtures :all
  describe 'met tenant en role' do

    before do
      @user = ::User.first

      AnnouncementPlan.configure do |config|
        config.with_tenant = true # 3 false 2
        config.with_role = true
      end

    end

    after do
      AnnouncementPlan.configuration = nil
      AnnouncementPlan.configure {}
    end

    

   it "current amount in testset" do
        AnnouncementPlan::Announcement.current(Date.new(2015,9,20)).size.must_equal 8
    end

  end

  describe 'zonder tenant en met role' do

    before do
      @user = ::User.first
      @date = Date.new(2015,9,20)

      AnnouncementPlan.configure do |config|
        config.with_tenant = false # 3 false 2
        config.with_role = true
      end

    end

    after do
      AnnouncementPlan.configuration = nil
      AnnouncementPlan.configure {}
    end

   it "as_user amount in testset" do
        AnnouncementPlan::Announcement.as_user(@user).current(@date).map(&:id).sort.must_equal [1,3,4]
    end


   it "as_tenant amount in testset" do
        AnnouncementPlan::Announcement.as_tenant(@user).current(@date).map(&:id).sort.must_equal [1,2]
    end    

   it "as_role amount in testset" do
        AnnouncementPlan::Announcement.as_role(@user).current(@date).map(&:id).sort.must_equal []
    end   

   it "for_user amount in testset" do
        AnnouncementPlan::Announcement.for_user(@user, @date).map(&:id).sort.must_equal [3,4]
    end

   it "read amount in testset" do
        AnnouncementPlan::Announcement.read(@user).map(&:id).sort.must_equal [1]
    end        
  end


  describe 'met tenant en met role' do

    before do
      @user = ::User.first
      @date = Date.new(2015,9,20)

      AnnouncementPlan.configure do |config|
        config.with_tenant = true # 3 false 2
        config.with_role = true
      end

    end

    after do
      AnnouncementPlan.configuration = nil
      AnnouncementPlan.configure {}
    end

   it "as_user amount in testset" do
        AnnouncementPlan::Announcement.as_user(@user).current(@date).map(&:id).sort.must_equal [1,3,4]
    end


   it "as_tenant amount in testset" do
        AnnouncementPlan::Announcement.as_tenant(@user).current(@date).map(&:id).sort.must_equal [1,2]
    end    

   it "as_role amount in testset" do
        AnnouncementPlan::Announcement.as_role(@user).current(@date).map(&:id).sort.must_equal []
    end   

   it "for_user amount in testset" do
        AnnouncementPlan::Announcement.for_user(@user, @date).map(&:id).sort.must_equal [2,3,4]
    end

   it "read amount in testset" do
        AnnouncementPlan::Announcement.read(@user).map(&:id).sort.must_equal [1]
    end    
  end

end


