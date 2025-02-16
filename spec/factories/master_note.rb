FactoryBot.define do

  factory :master_note do
    date { Faker::Date.backward(days: 150) }

    factory :master_note_with_notes do
      transient do
        notes_count { 10 }
      end

      after(:create) do |master_note, evaluator|
        create_list(:note, evaluator.notes_count, master_note: master_note)
      end
    end
  end
end
