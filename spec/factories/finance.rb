FactoryBot.define do

  factory :finance do
    day { Faker::Date.backward(days: 150) }
    description { Faker::Lorem.words(number: 3) }
    value { 250 }
    income_type
  end
end
