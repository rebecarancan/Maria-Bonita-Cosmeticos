FactoryBot.define do
  factory :master_finance do
    date { Faker::Date.backward(150) }
    initial_balance { Faker::Commerce.price }
    final_balance { Faker::Commerce.price }
  end
end
