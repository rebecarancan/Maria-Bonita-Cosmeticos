FactoryBot.define do

  factory :order do
    purchase { Faker::Date.backward(50) }
    expire { Faker::Date.backward(150) }
    payment { ['-', 'Dinheiro', 'Boleto/Dinheiro', 'Boleto/Banco', 'Cheque'].sample }
    value { '150,00' }
    supplier
  end
end
