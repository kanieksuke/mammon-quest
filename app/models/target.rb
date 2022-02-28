class Target < ApplicationRecord
  with_options presence: true do
    validates :max_hp, numericality: {only_integer: true, greater_than_or_equal_to: 1}
    validates :max_mp, numericality: {only_integer: true, greater_than_or_equal_to: 1}
    validates :current_hp
    validates :current_mp
  end
end
