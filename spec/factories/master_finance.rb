FactoryBot.define do
  factory :master_finance do
    date { Faker::Date.backward(days: 150) }
    initial_balance { '150,00' }

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
