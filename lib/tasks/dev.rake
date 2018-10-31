namespace :dev do

  desc "Cria Produtos Fake"
  task gen_products: :environment do
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
  end


end
