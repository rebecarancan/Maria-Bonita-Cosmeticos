FactoryBot.define do

  factory :note do
    day { Faker::Date.backward(150) }
    value { Faker::Commerce.price }
    supplier
  end
end
