FactoryBot.define do

  factory :master_sale do
    date { Faker::Date.backward(150) }
  end
end
