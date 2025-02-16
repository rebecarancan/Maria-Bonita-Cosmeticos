require 'rails_helper'

feature "Products", type: :feature, js: true do

  let!(:user) { create :user }
  let! (:login) { login_as(user, :scope => :user) }
  let!(:product1) { create :product }
  let!(:product2) { create :product }

  scenario 'Test index' do
    visit(products_path)
    expect(page).to have_content(:all, product1.name)
    expect(page).to have_content(:all, product2.name)
  end

  scenario 'Verify search' do
    visit(products_path)
    fill_in 'Pesquisar por...', with: product1.name
    click_on('Ok!')

    expect(page).to have_content(:all, product1.name)
    expect(page).not_to have_content(:all, product2.name)
  end

  scenario 'Verify new product link' do
    visit(products_path)
    expect(page).to have_link('Novo')
  end

  scenario 'Verify new product form' do
    visit(products_path)
    click_on('Novo')
    expect(page).to have_content(:all, 'Novo Produto')
    expect(page).to have_button('Salvar')
    expect(page).to have_link('Voltar')
  end

  scenario 'Creates a new product' do
    visit(new_product_path)
    product_name = Faker::Commerce.product_name

    fill_in('Código', with: Faker::Number.number(digits: 6))
    fill_in('Nome', with: product_name)
    fill_in('Custo', with: '100,00')
    fill_in('Margem', with: Faker::Number.between(from: 45, to: 80))
    click_button('Salvar')

    expect(Product.last.name).to eq(product_name)
    expect(page).to have_content(:all, 'criado com sucesso!')
  end

  scenario 'Creates an invalid product' do
    visit(new_product_path)
    click_on('Salvar')
    expect(page).to have_content(:all, 'não pode ficar em branco')
  end

  scenario 'Edits a product' do
    new_name = Faker::Commerce.product_name
    visit(edit_product_path(product1.id))

    fill_in('Nome', with: new_name)
    click_button('Salvar')

    expect(page).to have_content(:all, 'atualizado com sucesso!')
    expect(page).to have_content(:all, new_name)
  end

  scenario 'Destroy a product', js: true do

    visit(products_path)
    find('.typcn.typcn-times.basic-color', match: :first).click
    1.second
    page.driver.browser.switch_to.alert.accept

    expect(page).to have_content(:all, "excluído com sucesso!")
  end

end
