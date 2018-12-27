FactoryBot.define do

  factory :expense_type do
    #name { ['Aluguel', 'Arcon', 'Boleto', 'Bombeiro', 'Casa', 'Comida', 'Contador', 'Cristal', 'Depósito Banco' ].sample }
    name { 'Limpeza' }
  end
end
