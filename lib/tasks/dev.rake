MESES = ["Janeiro", "Fevereiro", "Março", "Abril", "Maio","Junho", "Julho",
          "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"]

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

    puts "Gerando as PLANILHAS..."
    12.times do
      MasterFinance.create!(
        year: "2018",
        month: MESES.sample
      )
    end
    puts "PLANILHAS geradas com sucesso!"

    puts "Gerando as ENTRADAS..."
    MasterFinance.all.each do |finance|
      Random.rand(10..20).times do |i|
        Finance.create!(
        day: Date.today - Random.rand(90),
        income_type: IncomeType.all.sample,
        description: Faker::Lorem.sentence(3),
        value: "#{Random.rand(500)},#{Random.rand(99)}",
        master_finance: finance
        )
      end
    end
    puts "ENTRADAS geradas com sucesso!"

    puts "Gerando as SAÍDAS..."
    MasterFinance.all.each do |finance|
      Random.rand(10..20).times do |i|
        Finance.create!(
        day: Date.today - Random.rand(90),
        expense_type: ExpenseType.all.sample,
        description: Faker::Lorem.sentence(3),
        value: "#{Random.rand(500)},#{Random.rand(99)}",
        master_finance: finance
        )
      end
    end
    puts "SAÍDAS geradas com sucesso!"
  end
end
