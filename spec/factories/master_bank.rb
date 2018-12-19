FactoryBot.define do

  # post factory with a `belongs_to` association for the user
  factory :master_bank do
    date { Faker::Date.backward(150) }
    initial_balance { Faker::Commerce.price }
    final_balance { Faker::Commerce.price }
    # done { true }
    # bank
  end

  # factory :expense_type do
  #   name { Faker::Lorem.word }
  #   bank
  # end

  # factory :income_type do
  #   name { Faker::Lorem.word }
  #   bank
  # end

  # # user factory without associated posts
  # factory :bank do
  #   day { Faker::Date.backward(150) }
  #   description { Faker::Lorem.sentence(3) }
  #   value { Faker::Commerce.price }


  #   # user_with_posts will create post data after the user has been created
  #   factory :bank_with_master_banks do
  #     # posts_count is declared as a transient attribute and available in
  #     # attributes on the factory, as well as the callback via the evaluator
  #     transient do
  #       master_banks_count { 5 }
  #     end

  #     # the after(:create) yields two values; the user instance itself and the
  #     # evaluator, which stores all values from the factory, including transient
  #     # attributes; `create_list`'s second argument is the number of records
  #     # to create and we make sure the user is associated properly to the post
  #     after(:create) do |bank, evaluator|
  #       create_list(:master_bank, evaluator.master_banks_count, bank: bank)
  #     end
  #   end
  # end
end
