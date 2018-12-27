FactoryBot.define do
  factory :product do
    name { Faker::Commerce.product_name }
    code { Faker::Number.number(6) }
    cost { '50,00' }
    margin { Faker::Number.between(45, 80) }
  end
end
