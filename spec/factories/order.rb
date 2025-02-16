FactoryBot.define do

  factory :order do
    purchase { Faker::Date.backward(days: 50) }
    expire { Faker::Date.backward(days: 150) }
    payment { ['-', 'Dinheiro', 'Boleto/Dinheiro', 'Boleto/Banco', 'Cheque'].sample }
    value { '150,00' }
    supplier
  end
end
