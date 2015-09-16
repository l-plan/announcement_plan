require 'test_helper'
# require 'pry'
module AnnouncementPlan

  class AnnouncementsControllerTest < ActionController::TestCase
    # binding.pry
    setup do
      @announcement = announcement_plan_announcements(:announcement_1)
      @routes = Engine.routes
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:announcements)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create announcement" do
      assert_difference('Announcement.count') do
        post :create, announcement: { category_id: @announcement.category_id, start_announcing_at: @announcement.start_announcing_at, stop_announcing_at: @announcement.stop_announcing_at, tekst: @announcement.tekst, title: @announcement.title }
      end

      assert_redirected_to announcement_path(assigns(:announcement))
    end

    test "should show announcement" do
      get :show, id: @announcement
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @announcement
      assert_response :success
    end

    test "should update announcement" do
      patch :update, id: @announcement, announcement: { category_id: @announcement.category_id, start_announcing_at: @announcement.start_announcing_at, stop_announcing_at: @announcement.stop_announcing_at, tekst: @announcement.tekst, title: @announcement.title }
      assert_redirected_to announcement_path(assigns(:announcement))
    end

    test "should destroy announcement" do
      assert_difference('Announcement.count', -1) do
        delete :destroy, id: @announcement
      end

      assert_redirected_to announcements_path
    end
  end
end
