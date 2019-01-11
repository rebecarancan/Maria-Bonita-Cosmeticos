namespace :user do

  desc "Create a User"
  task :login, [:email, :password, :password_confirmation] => :environment do |task, args|
    puts "Gerando o usuário padrão..."
    User.create!(
      email: args[:email],
      password: args[:password],
      password_confirmation: args[:password_confirmation]
      )
    puts "Usuário padrão cadastrado... [OK]"
  end
end
