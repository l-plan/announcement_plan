require 'test_helper'

class RoleSourcesControllerTest < ActionController::TestCase
  setup do
    @role_source = role_sources(:role_source_1  )
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:role_sources)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create role_source" do
    assert_difference('RoleSource.count') do
      post :create, role_source: { naam: @role_source.naam }
    end

    assert_redirected_to role_source_path(assigns(:role_source))
  end

  test "should show role_source" do
    get :show, id: @role_source
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @role_source
    assert_response :success
  end

  test "should update role_source" do
    patch :update, id: @role_source, role_source: { naam: @role_source.naam }
    assert_redirected_to role_source_path(assigns(:role_source))
  end

  test "should destroy role_source" do
    assert_difference('RoleSource.count', -1) do
      delete :destroy, id: @role_source
    end

    assert_redirected_to role_sources_path
  end
end
