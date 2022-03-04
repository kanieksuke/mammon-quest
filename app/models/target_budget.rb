class TargetBudget
  include ActiveModel::Model
  attr_accessor :target_amount, :target_date, :current_amount, :current_date, :income, :fixed_cost, :attack, :resist, :user_id

  with_options presence: true do
    validates :target_amount, numericality: {only_integer: true, greater_than_or_equal_to: 1}
    validates :target_date, numericality: {only_integer: true, greater_than_or_equal_to: 1}
    validates :current_amount, numericality: {only_integer: true}
    validates :current_date, numericality: {only_integer: true}
    validates :user_id
    validates :income, numericality: {only_integer: true}
    validates :fixed_cost, numericality: {only_integer: true}
    validates :attack, numericality: {only_integer: true}
    validates :resist, numericality: {only_integer: true}
  end

  def save
    target = Target.create(target_amount: target_amount, target_date: target_date, user_id: user_id, current_amount: current_amount, current_date: current_date)
    Budget.create(income: income, fixed_cost: fixed_cost, attack: attack, resist: resist, target_id: target.id)
  end
end