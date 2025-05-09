class Wall < ApplicationRecord
  has_many :blocks
  has_many :presenting_blocks, class_name: "Block", foreign_key: "presenting_wall_id"
  has_one :page, class_name: "Block", foreign_key: "page_id"
end
