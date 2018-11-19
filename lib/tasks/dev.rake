require "#{Rails.root}/app/helpers/application_helper"
include ApplicationHelper

namespace :dev do

  desc "Popular Banco de Dados"
  task setup: :environment do

    puts "Gerando os PRODUTOS..."
    50.times do
      Product.create!(
        code: Faker::Number.number(6),
        name: Faker::Commerce.product_name,
        cost: Faker::Commerce.price,
        margin: Faker::Number.between(45, 80)
      )
    end
    puts "PRODUTOS gerados com sucesso!"

    puts "Gerando as FINANÇAS DIÁRIAS..."
    12.times do
      MasterFinance.create!(
        year: "2018",
        month: MESES.sample,
        balance: "#{Random.rand(500)},#{Random.rand(99)}"
      )
    end
    puts "FINANÇAS DIÁRIAS geradas com sucesso!"

    puts "Gerando as ENTRADAS FINANÇAS DIÁRIAS..."
    MasterFinance.all.each do |finance|
      Random.rand(5..15).times do |i|
        Finance.create!(
        day: Date.today - Random.rand(90),
        income_type: IncomeType.all.sample,
        description: Faker::Lorem.sentence(3),
        value: "#{Random.rand(500)},#{Random.rand(99)}",
        master_finance: finance
        )
      end
    end
    puts "ENTRADAS FINANÇAS DIÁRIAS geradas com sucesso!"

    puts "Gerando as SAÍDAS FINANÇAS DIÁRIAS..."
    MasterFinance.all.each do |finance|
      Random.rand(5..15).times do |i|
        Finance.create!(
        day: Date.today - Random.rand(90),
        expense_type: ExpenseType.all.sample,
        description: Faker::Lorem.sentence(3),
        value: "#{Random.rand(500)},#{Random.rand(99)}",
        master_finance: finance
        )
      end
    end
    puts "SAÍDAS FINANÇAS DIÁRIAS geradas com sucesso!"

    puts "Gerando as ENTRADAS DIÁRIAS..."
    15.times do
      MasterSale.create!(
        year: "2018",
        month: MESES.sample
      )
    end
    puts "ENTRADAS DIÁRIAS geradas com sucesso!"

    puts "Gerando os LANÇAMENTOS ENTRADAS DIÁRIAS..."
    MasterSale.all.each do |sale|
      Random.rand(5..15).times do |i|
        Sale.create!(
        day: Date.today - Random.rand(90),
        income_type: IncomeType.all.sample,
        value: "#{Random.rand(500)},#{Random.rand(99)}",
        master_sale: sale
        )
      end
    end
    puts "LANÇAMENTOS ENTRADAS DIÁRIAS gerados com sucesso!"

    puts "Gerando os PEDIDOS E PAGAMENTOS..."
    15.times do
      MasterOrder.create!(
        year: "2018",
        month: MESES.sample
      )
    end
    puts "PEDIDOS E PAGAMENTOS gerados com sucesso!"

    puts "Gerando os LANÇAMENTOS PEDIDOS E PAGAMENTOS..."
    MasterOrder.all.each do |order|
      Random.rand(5..15).times do |i|
        Order.create!(
        purchase: Date.today - Random.rand(90),
        expire: Date.today - Random.rand(90),
        distributor: DISTRIBUIDORAS.sample,
        value: "#{Random.rand(500)},#{Random.rand(99)}",
        payment: PAGAMENTOS.sample,
        master_order: order
        )
      end
    end
    puts "LANÇAMENTOS PEDIDOS E PAGAMENTOS gerados com sucesso!"

  end
end
