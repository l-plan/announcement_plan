require "test_helper"

describe RolesController do
  let(:role) { roles(:one) }

  it "should get index" do
    get roles_url
    must_respond_with :success
  end

  it "should get new" do
    get new_role_url
    must_respond_with :success
  end

  it "should create role" do
    assert_difference("Role.count") do
      post roles_url, params: { role: { name: @role.name, user_id: @role.user_id } }
    end

    must_redirect_to role_url(Role.last)
  end

  it "should show role" do
    get role_url(@role)
    must_respond_with :success
  end

  it "should get edit" do
    get edit_role_url(@role)
    must_respond_with :success
  end

  it "should update role" do
    patch role_url(@role), params: { role: { name: @role.name, user_id: @role.user_id } }
    must_redirect_to role_url(role)
  end

  it "should destroy role" do
    assert_difference("Role.count", -1) do
      delete role_url(@role)
    end

    must_redirect_to roles_url
  end
end
