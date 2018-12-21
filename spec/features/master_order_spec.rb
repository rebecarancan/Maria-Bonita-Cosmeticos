require 'rails_helper'

feature "MasterOrders", type: :feature, js: true do

  before do
    user = create(:user)
    login_as(user, :scope => :user)
  end

  scenario 'Creates a new master_order' do # Happy Path
    visit(new_accounting_master_order_path)

    find(:xpath, "/html/body/form[@class='basic-grey']/div[@class='form-row'][1]/div[@class='col-md-2 mb-10']/select[@id='master_order_date_2i']").select('Fevereiro')
    click_button('Salvar')

    expect(page).to have_content("criado com sucesso!")
  end

  # scenario 'Creates a master_order_with_orders' do # Happy Path
  #   visit(new_accounting_master_order_path)

  #   find(:xpath, "/html/body/form[@class='basic-grey']/div[@class='form-row'][1]/div[@class='col-md-2 mb-10']/select[@id='master_order_date_2i']").select('Fevereiro')
  #   find(:xpath, "/html/body/form[@class='basic-grey']/div[@id='orders']/div[@class='links']/a[@class='badge badge-pill badge-secondary add_fields']").click
  #   fill_in('Data do pedido', with: Faker::Date.backward(150))
  #   fill_in('Vencimento', with: Faker::Date.backward(100))
  #   select('6', from: 'Fornecedor')
  #   fill_in('Valor', with: Faker::Commerce.price)
  #   select('Dinheiro', from: 'Tipo de pagamento')
  #   click_button('Salvar')

  #   expect(page).to have_content("criado com sucesso!")
  # end

  scenario 'Edits a master_order' do # Happy Path
    master_order = create(:master_order)
    visit(edit_accounting_master_order_path(master_order.id))

    find(:xpath, "/html/body/form[@class='basic-grey']/div[@class='form-row'][1]/div[@class='col-md-2 mb-10']/select[@id='master_order_date_2i']").select('Fevereiro')
    click_button('Salvar')

    expect(page).to have_content('atualizado com sucesso!')
  end

  scenario 'Destroy a master_order', js: true do
    master_order = create(:master_order)

    visit(accounting_master_orders_path)
    find(:xpath, "/html/body/div[@class='container-table100']/div[@class='wrap-table100']/div[@class='table100']/table/tbody/tr[1]/td[@class='column5'][3]/a/span[@class='typcn typcn-times basic-color']").click
    1.second
    page.driver.browser.switch_to.alert.accept

    expect(page).to have_content("excluído com sucesso!")
  end

end
