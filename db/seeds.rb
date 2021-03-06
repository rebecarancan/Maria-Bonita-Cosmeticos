# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# puts "Gerando o usuário padrão..."
# User.create!(
#   email: "admin@admin.com",
#   password: "123456",
#   password_confirmation: "123456"
#   )
# puts "Usuário padrão cadastrado... [OK]"

###############################################################

puts "Gerando os Fornecedores (Supplier)..."
Supplier.create!([{name: "Aladim"},
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
puts "Gerando os Fornecedores (Supplier)... [OK]"

###############################################################

puts "Gerando os tipos de entrada (IncomeType)..."
IncomeType.create!([{name: "Dinheiro"},
      {name: "Débito"},
      {name: "Crédito"},
      {name: "Caixa"},
      {name: "Banco/Loja"}])
puts "Gerando os tipos de entrada (IncomeType)... [OK]"

###############################################################

puts "Gerando os tipos de saída (ExpenseType)..."
ExpenseType.create!([{name: "Acerto"},
      {name: "Adesivos"},
      {name: "Aladim"},
      {name: "Aluguel"},
      {name: "Arcon"},
      {name: "Boleto"},
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
