FactoryBot.define do
  factory :supplier do
    name { Faker::Company.name }
  end
end
