class Todo < ApplicationRecord
  validates :description, :deadline, presence: true
  validates_inclusion_of :done, in: [true, false]
end
