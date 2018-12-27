FactoryBot.define do

  factory :finance do
    day { Faker::Date.backward(150) }
    description { Faker::Lorem.words(3) }
    value { 250 }
    income_type
  end
end
