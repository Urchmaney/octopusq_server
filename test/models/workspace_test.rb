require "test_helper"

class WorkspaceTest < ActiveSupport::TestCase
  test "the users own workspaces" do
    assert_equal 1, users(:one).workspaces.count
  end
end
