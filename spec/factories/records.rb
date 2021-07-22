FactoryBot.define do
  factory :record do
    weight { 88.25 }
    body_fat              { 20.5 }
    memo                  { Faker::Lorem.sentence }
    input_day             { 2021 - 0o7 - 20 }
    assessment            { '○' }
    association :user
  end
end
