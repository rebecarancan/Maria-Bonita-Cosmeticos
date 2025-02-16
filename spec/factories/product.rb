FactoryBot.define do
  factory :product do
    name { Faker::Commerce.product_name }
    code { Faker::Number.number(digits: 6) }
    cost { '50,00' }
    margin { Faker::Number.between(from: 45, to: 80) }
  end
end
