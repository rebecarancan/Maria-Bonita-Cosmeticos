require 'rails_helper'

feature "Products", type: :feature, js: true do

  before do
    user = create(:user)
    login_as(user, :scope => :user)
  end

  scenario 'Test index' do
    product1 = create(:product)

    product2 = create(:product)

    visit(products_path)
    expect(page).to have_content(product1.name).and have_content(product2.name)
  end

  # scenario 'Verify search' do
  #   visit(products_path)
  #   fill_in 'Pesquisar por...', with: 'teste'
  #   click_on('Ok!')

  #   expect(page).to have_content('teste')
  # end

  scenario 'Verify new product link' do
    visit(products_path)
    expect(page).to have_link('Novo')
  end

  scenario 'Verify new product form' do
    visit(products_path)
    click_on('Novo')
    expect(page).to have_content('Novo Produto')
    expect(page).to have_button('Salvar')
    expect(page).to have_link('Voltar')
  end

  # scenario 'Creates a new product' do # Happy Path
  #   visit(new_product_path)
  #   product_name = Faker::Commerce.product_name

  #   fill_in('Código', with: Faker::Number.number(6))
  #   fill_in('Nome', with: product_name)
  #   fill_in('Custo', with: Faker::Commerce.price)
  #   fill_in('Margem', with: Faker::Number.between(45, 80))
  #   click_button('Salvar')

  #   expect(Product.last.name).to eq(product_name)
  #   # expect(page).to have_content('criado com sucesso!')
  # end

  scenario 'Creates an invalid product' do # Sad Path
    visit(new_product_path)
    click_on('Salvar')
    expect(page).to have_content('não pode ficar em branco')
  end

  scenario 'Edits a product' do # Happy Path
    product = create(:product)
    new_name = Faker::Commerce.product_name
    visit(edit_product_path(product.id))

    fill_in('Nome', with: new_name)
    click_button('Salvar')

    expect(page).to have_content('atualizado com sucesso!')
    expect(page).to have_content(new_name)
  end

  scenario 'Destroy a product', js: true do
    product = create(:product)

    visit(products_path)
    find(:xpath, "/html/body/div[@class='container-table100']/div[@class='wrap-table100']/div[@class='table100']/table/tbody/tr[1]/td[@class='column6']/a/span[@class='typcn typcn-times basic-color']").click
    1.second
    page.driver.browser.switch_to.alert.accept

    expect(page).to have_content("excluído com sucesso!")
  end

end
