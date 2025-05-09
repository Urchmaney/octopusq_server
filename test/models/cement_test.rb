require "test_helper"

class CementTest < ActiveSupport::TestCase
  test "blocks present in cement" do
    assert_equal 1, cements(:first_wall_cement).blocks.count
  end
end
