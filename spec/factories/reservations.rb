FactoryBot.define do
  factory :reservation do
    reservation_day         { 2021-07-20 }
    reservation_time        {'15:00'}
    association :user
  end
end
