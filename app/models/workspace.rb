class Workspace < ApplicationRecord
  belongs_to :user
  has_one :root_cement, class_name: "Cement", foreign_key: "root_workspace_id"
  attr_accessor :question
  after_create :create_root_cement

  delegate :blocks, to: :root_cement

  def create_root_cement
    return unless question

    root_cement = build_root_cement(question: question, workspace: self)
    root_cement.save
  end
end
