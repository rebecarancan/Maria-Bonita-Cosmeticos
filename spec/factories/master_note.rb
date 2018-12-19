FactoryBot.define do

  # post factory with a `belongs_to` association for the user
  factory :master_note do
    date { Faker::Date.backward(150) }
    # note
    # supplier
  end

  # # user factory without associated posts
  # factory :note do
  #   day { Faker::Date.backward(150) }
  #   value { Faker::Commerce.price }

  #   # user_with_posts will create post data after the user has been created
  #   factory :note_with_suppliers do
  #     # posts_count is declared as a transient attribute and available in
  #     # attributes on the factory, as well as the callback via the evaluator
  #     transient do
  #       suppliers_count { 5 }
  #     end

  #      after(:create) do |note, evaluator|
  #       create_list(:supplier, evaluator.supplier_count, note: note)
  #     end
  #   end



  #   factory :note_with_master_notes do
  #     # posts_count is declared as a transient attribute and available in
  #     # attributes on the factory, as well as the callback via the evaluator
  #     transient do
  #       master_notes_count { 5 }
  #     end

  #     # the after(:create) yields two values; the user instance itself and the
  #     # evaluator, which stores all values from the factory, including transient
  #     # attributes; `create_list`'s second argument is the number of records
  #     # to create and we make sure the user is associated properly to the post

  #     after(:create) do |note, evaluator|
  #       create_list(:master_note, evaluator.master_notes_count, note: note)
  #     end
  #   end
  # end
end
