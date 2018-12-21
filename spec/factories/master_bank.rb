FactoryBot.define do
  factory :master_bank do
    date { Faker::Date.backward(150) }
    initial_balance { Faker::Commerce.price }
    final_balance { Faker::Commerce.price }

    factory :master_bank_with_banks do
      transient do
        banks_count { 10 }
      end

      after(:create) do |master_bank, evaluator|
        create_list(:bank, evaluator.banks_count, master_bank: master_bank)
      end
    end
  end
end
