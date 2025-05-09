require "test_helper"

class WallTest < ActiveSupport::TestCase
  test "page maps to right block" do
    assert_equal walls(:second_wall).page, blocks(:second_wall_page_block)
  end
end
