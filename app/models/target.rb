class Target < ApplicationRecord
  with_options presence: true do
    validates :target_amount, numericality: {only_integer: true, greater_than_or_equal_to: 1}
    validates :target_date, numericality: {only_integer: true, greater_than_or_equal_to: 1}
    validates :current_amount, numericality: {only_integer: true}
    validates :current_date, numericality: {only_integer: true}
  end
end
