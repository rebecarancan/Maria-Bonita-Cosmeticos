FactoryBot.define do

  factory :bank do
    day { Faker::Date.backward(days: 150) }
    description { Faker::Lorem.words(number: 3) }
    value { '150,00' }
    income_type
    expense_type
  end
end
