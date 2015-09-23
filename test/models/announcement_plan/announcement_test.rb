require 'test_helper'
require 'minitest/autorun'
require 'pry'

module AnnouncementPlan
  class AnnouncementTest < ActiveSupport::TestCase

  	setup do
      @announcement = announcement_plan_announcements(:announcement_1)
      @user = ::User.first

    end

    test "the truth" do
      # assert @announcement.users.size = 4
      assert_equal 1, @announcement.addressees.size

    end

    test "the truth again" do
      # assert @announcement.users.size = 4
      assert_equal 1, @announcement.class.addressee(@user).size

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
