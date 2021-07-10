FactoryBot.define do
  factory :target do
    goal_weight { 88 }
    period_id   { 3 }
    plan        { Faker::Lorem.sentence }
    association :user
  end
end
