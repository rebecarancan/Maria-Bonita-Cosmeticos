FactoryBot.define do

  factory :income_type do
    name { 'Dinheiro' }
    #name { ['Dinheiro', 'Débito', 'Crédito'].sample }
  end
end
