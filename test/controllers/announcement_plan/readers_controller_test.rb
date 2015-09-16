require 'test_helper'

module AnnouncementPlan
  class ReadersControllerTest < ActionController::TestCase
    setup do
      @reader = announcement_plan_readers(:reader_1)
      @routes = Engine.routes
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:readers)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create reader" do
      assert_difference('Reader.count') do
        post :create, reader: { announcement_id: @reader.announcement_id, user_id: @reader.user_id }
      end

      assert_redirected_to reader_path(assigns(:reader))
    end

    test "should show reader" do
      get :show, id: @reader
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @reader
      assert_response :success
    end

    test "should update reader" do
      patch :update, id: @reader, reader: { announcement_id: @reader.announcement_id, user_id: @reader.user_id }
      assert_redirected_to reader_path(assigns(:reader))
    end

    test "should destroy reader" do
      assert_difference('Reader.count', -1) do
        delete :destroy, id: @reader
      end

      assert_redirected_to readers_path
    end
  end
end
