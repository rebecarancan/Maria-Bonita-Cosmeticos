FactoryBot.define do

  factory :master_sale do
    date { Faker::Date.backward(days: 150) }

    factory :master_sale_with_sales do
      transient do
        sales_count { 10 }
      end

      after(:create) do |master_sale, evaluator|
        create_list(:sale, evaluator.sales_count, master_sale: master_sale)
      end
    end
  end
end
