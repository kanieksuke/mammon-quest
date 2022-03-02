class Budget < ApplicationRecord
  with_options presence: true do
    validates :income, numericality: {only_integer: true}
    validates :fixed_cost, numericality: {only_integer: true}
    validates :attack, numericality: {only_integer: true}
    validates :resist, numericality: {only_integer: true}
  end
  belongs_to :user
  belongs_to :target
end
