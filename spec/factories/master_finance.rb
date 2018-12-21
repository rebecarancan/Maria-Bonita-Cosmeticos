FactoryBot.define do
  factory :master_finance do
    date { Faker::Date.backward(150) }
    initial_balance { Faker::Commerce.price }
    final_balance { Faker::Commerce.price }

    factory :master_finance_with_finances do
      transient do
        finances_count { 10 }
      end

      after(:create) do |master_finance, evaluator|
        create_list(:finance, evaluator.finances_count, master_finance: master_finance)
      end
    end
  end
end
