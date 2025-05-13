require "test_helper"

class WorkspacesControllerTest < ActionDispatch::IntegrationTest
  fixtures :users

  def login_as(email, password)
    post sessions_url, params: { email_address: email, password: password }
    assert_response :success
  end

  setup do
    https!
    login_as(users(:one).email_address, "password")
    @workspace = workspaces(:one)
  end

  test "should get index" do
    get workspaces_url, as: :json
    assert_response :success
  end

  test "should create workspace" do
    assert_difference("Workspace.count") do
      post workspaces_url, params: { workspace: { name: @workspace.name } }, as: :json
    end

    assert_response :created
  end

  test "should show workspace" do
    get workspace_url(@workspace), as: :json
    assert_response :success
  end

  test "should update workspace" do
    patch workspace_url(@workspace), params: { workspace: { name: @workspace.name } }, as: :json
    assert_response :success
  end

  test "should destroy workspace" do
    assert_difference("Workspace.count", -1) do
      delete workspace_url(@workspace), as: :json
    end

    assert_response :no_content
  end
end
