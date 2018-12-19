FactoryBot.define do

  factory :master_order do
    date { Faker::Date.backward(150) }
  end
end
