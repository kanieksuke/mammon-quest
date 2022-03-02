class TargetBudget
  include ActiveModel::Model
  attr_accessor :target_amount, :target_date, :current_amount, :current_date, :income, :fixed_cost, :attack, :resist, :user_id, :target_id
end