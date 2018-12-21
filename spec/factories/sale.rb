FactoryBot.define do

  factory :sale do
    day { Faker::Date.backward(150) }
    value { Faker::Commerce.price }
    income_type
    master_sale
  end
end
