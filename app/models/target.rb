class Target < ApplicationRecord
  belongs_to :user
  has_one :budget, dependent: :destroy
end
