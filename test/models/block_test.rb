require "test_helper"

class BlockTest < ActiveSupport::TestCase
  test "all block present" do
    assert_equal 2, Block.count
  end

  test "block return right presenting wall" do
    assert_equal blocks(:first_wall_present_block).presenting_wall, walls(:first_wall)
  end
end
