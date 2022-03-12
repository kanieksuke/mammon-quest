class Target < ApplicationRecord
  belongs_to :user
  has_one :budget, dependent: :destroy
  has_one :shopping, dependent: :destroy
  has_many :messages, dependent: :destroy
end
