FactoryBot.define do

  factory :master_order do
    date { Faker::Date.backward(days: 150) }

    factory :master_order_with_orders do
      transient do
        orders_count { 10 }
      end

      after(:create) do |master_order, evaluator|
        create_list(:order, evaluator.orders_count, master_order: master_order)
      end
    end
  end
end
