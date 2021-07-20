FactoryBot.define do
  factory :message do
    text                  { Faker::Lorem.sentence }
    user_nickname         { Faker::Lorem.word }
    room_id               { 1 }
    association :user
  end
end
