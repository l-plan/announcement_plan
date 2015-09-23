require 'test_helper'

module AnnouncementPlan
  class AddresseesControllerTest < ActionController::TestCase
    setup do
      @addressee = announcement_plan_addressees(:addressee_1)
      @routes = Engine.routes
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:addressees)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create addressee" do
      assert_difference('Addressee.count') do
        post :create, addressee: { announcement_id: @addressee.announcement_id, user_id: @addressee.user_id }
      end

      assert_redirected_to addressee_path(assigns(:addressee))
    end

    test "should show addressee" do
      get :show, id: @addressee
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @addressee
      assert_response :success
    end

    test "should update addressee" do
      patch :update, id: @addressee, addressee: { announcement_id: @addressee.announcement_id, user_id: @addressee.user_id }
      assert_redirected_to addressee_path(assigns(:addressee))
    end

    test "should destroy addressee" do
      assert_difference('Addressee.count', -1) do
        delete :destroy, id: @addressee
      end

      assert_redirected_to addressees_path
    end
  end
end
