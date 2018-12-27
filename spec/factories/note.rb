FactoryBot.define do

  factory :note do
    day { Faker::Date.backward(150) }
    value { '150,00' }
    supplier
  end
end
