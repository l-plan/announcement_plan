require 'test_helper'
require 'minitest/autorun'
require 'pry'


module AnnouncementPlan
  class AnnouncementTest < ActiveSupport::TestCase


  	setup do
      @announcement = announcement_plan_announcements(:announcement_1)
      @user = ::User.first
       # stub goes away once the block is done

    end

    

    test "current amount in testset-no-time" do
      Time.stub :now, Time.new(2014,9,16) do 
        Announcement.current.size.must_equal 0
      end
    end

    test "current amount in testset-with-time" do
      Time.stub :now, Time.new(2014,9,16) do 
        Announcement.current( Time.new(2015,9,17) ).size.must_equal 2
      end

    end
    test "2current amount in testset" do
      # assert @announcement.users.size = 4
      assert_equal 1, @announcement.addressees.size

    end

    test "the truth again" do
      # assert @announcement.users.size = 4
      assert_equal 1, @announcement.class.as_addressee(@user).size

    end


  test "test unscoped op car-source" do
      Announcement.unscoped.size.must_equal 10
      # assert_equal 10, Announcement.unscoped.size
      # "A".downcase.must_equal 'b'
  end


  	 # let(:announcement) { }
    # test "the truth" do
    # 	# binding.pry
    #  #  @announcement.users.size.must_equal 13
    #  #  @announcement.users.size
    #  'a'.upcase.must_equal 'B'
    # end



# describe "when asked about integration-testing" do
    # test "test_the_obvious" do
    # 	'a'.upcase.must_equal 'B'
    # 	# @announcement.users.size.must_equal 13
    # end
# end
  end
end
