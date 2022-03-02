class Target < ApplicationRecord
  belongs_to :user
  has_many :budgets
end
