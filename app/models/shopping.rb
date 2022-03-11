class Shopping < ApplicationRecord
  belongs_to :target

  validates :resist, presence: true, numericality: {only_integer: true}
end
