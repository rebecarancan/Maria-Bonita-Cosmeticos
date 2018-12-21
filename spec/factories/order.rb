FactoryBot.define do

  factory :order do
    purchase { Faker::Date.backward(50) }
    expire { Faker::Date.backward(150) }
    payment { ['Dinheiro', 'Boleto', 'Cheque', 'Banco/Loja'].sample }
    value { Faker::Commerce.price }
    supplier
  end
end
