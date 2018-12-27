FactoryBot.define do

  factory :sale do
    day { Faker::Date.backward(150) }
    value { 50 }
    income_type
    master_sale
  end
end
