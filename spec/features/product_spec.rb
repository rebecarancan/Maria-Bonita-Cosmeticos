require 'rails_helper'

feature "Products", type: :feature do

  before do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
  end

  scenario 'Verify new product link' do
    visit(products_path)
    expect(page).to have_link('Novo')
  end

  scenario 'Verify new product form' do
    visit(products_path)
    click_on('Novo')
    expect(page).to have_content('Novo Produto')
    expect(page).to have_button('Salvar')
  end

  scenario 'Creates a new product' do # Happy Path
    visit(new_product_path)
    product_name = Faker::Commerce.product_name

    fill_in('Código', with: Faker::Number.number(6))
    fill_in('Nome', with: product_name)
    fill_in('Custo', with: Faker::Commerce.price)
    fill_in('Margem', with: Faker::Number.between(45, 80))
    click_on('Salvar')

    expect(page).to have_content('Produtos')
    expect(Product.last.name).to eq(product_name)
  end

  scenario 'Can not save the product' do # Sad Path
    visit(new_product_path)
    click_on('Salvar')
    expect(page).to have_content('não pode ficar em branco')
  end

end
