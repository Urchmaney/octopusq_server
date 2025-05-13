class Cement < ApplicationRecord
  has_many :blocks
  belongs_to :workspace
end
