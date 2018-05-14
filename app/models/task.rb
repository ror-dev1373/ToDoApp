class Task < ApplicationRecord
  belongs_to :project
  has_many :comments, dependent: :destroy
  enum priority: [:high, :low, :medium]
  enum status: [:open, :done]
  validates_presence_of :name, :description, :priority, :deadline
end
