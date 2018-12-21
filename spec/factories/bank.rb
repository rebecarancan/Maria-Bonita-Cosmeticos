FactoryBot.define do

  factory :bank do
    day { Faker::Date.backward(150) }
    description { Faker::Lorem.words(3) }
    value { Faker::Commerce.price }
    income_type
    expense_type
  end
end
