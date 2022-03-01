FactoryBot.define do
  factory :target do
    target_amount  {300000}
    target_date    {90}
    current_amount {300000}
    current_date   {0}
    association :user
  end
end
