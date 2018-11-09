# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Gerando os tipos de registros (RecordType)..."
RecordType.create!([{name: "Entrada"},
      {name: "Saída"}])
puts "Gerando os tipos de registros (RecordType)... [OK]"

puts "Gerando os tipos de entrada (IncomeType)..."
IncomeType.create!([{name: "Dinheiro"},
      {name: "Débito"},
      {name: "Crédito"},
      {name: "Caixa"},
      {name: "Banco/Loja"}])
puts "Gerando os tipos de entrada (IncomeType)... [OK]"

puts "Gerando os tipos de saída (ExpenseType)..."
ExpenseType.create!([{name: "Acerto"},
      {name: "Adesivos"},
      {name: "Aladim"},
      {name: "Aluguel"},
      {name: "Arcon"},
      {name: "Bombeiro"},
      {name: "Casa"},
      {name: "Comida"},
      {name: "Contador"},
      {name: "Cristal"},
      {name: "Depósito Banco"},
      {name: "Embalagens"},
      {name: "GAO"},
      {name: "Gasolina"},
      {name: "Glaucia"},
      {name: "Internet"},
      {name: "IPTU"},
      {name: "Limpeza"},
      {name: "Marco Boni"},
      {name: "Novo Toque"},
      {name: "Prolabore Beca"},
      {name: "Prolabore Nati"},
      {name: "Prolabore Sandra"},
      {name: "Real"},
      {name: "Ricosti"},
      {name: "Rio Vermelho"},
      {name: "Saque"},
      {name: "Wanderley"}])
puts "Gerando os tipos de saída (ExpenseType)... [OK]"

puts "Gerando os tipos de pagamento (Payment)..."
Payment.create!([{description: "Dinheiro"},
      {description: "Cheque"},
      {description: "Boleto/Dinheiro"},
      {description: "Boleto/Banco"}])
puts "Gerando os tipos de entrada (Payment)... [OK]"

puts "Gerando as distribuidoras (Distributor)..."
Distributor.create!([{name: "Aladim"},
      {name: "Arcon"},
      {name: "Aspa"},
      {name: "Cristal"},
      {name: "GAO"},
      {name: "Glaucia"},
      {name: "Marco Boni"},
      {name: "Make One"},
      {name: "Novo Toque"},
      {name: "Real"},
      {name: "Ricosti"},
      {name: "Rio Vermelho"},
      {name: "Wanderley"}])
puts "Gerando as distribuidoras (Distributor)... [OK]"
