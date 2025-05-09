class Block < ApplicationRecord
  belongs_to :wall, optional: true
  belongs_to :presenting_wall, class_name: "Wall", foreign_key: "presenting_wall_id", optional: true
  belongs_to :cement, optional: true
end
