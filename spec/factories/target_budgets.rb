FactoryBot.define do
  factory :target_budget do
    target_amount  {300000}
    target_date    {90}
    current_amount {300000}
    current_date   {0}
    income         {240000}
    fixed_cost     {120000}
    resist         {0}
    association :user
  end
end
