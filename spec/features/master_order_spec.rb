require 'rails_helper'

feature "MasterOrders", type: :feature, js: true do

  let!(:user) { create :user }
  let! (:login) { login_as(user, :scope => :user) }
  let!(:supplier) { create :supplier }
  let!(:master_order) { create :master_order }

  scenario 'Creates a new master_order' do # Happy Path
    visit(new_accounting_master_order_path)

    select('Março', from: 'master_order_date_2i')
    click_button('Salvar')

    expect(page).to have_content(:all, "criado com sucesso!")
  end

  scenario 'Creates a master_order_with_orders' do # Happy Path
    visit(new_accounting_master_order_path)

    select('Março', from: 'master_order_date_2i')
    click_link('Adicionar')
    within('.nested-fields') do
      fill_in('Data do pedido', with: Faker::Date.backward(150))
      fill_in('Vencimento', with: Faker::Date.backward(100))
      select('GAO', from: 'Fornecedor')
      fill_in('Valor', with: '250,00')
      select('Dinheiro', from: 'Tipo de pagamento')
    end

    click_link('Adicionar')
    within('.nested-fields:nth-child(2)') do
      fill_in('Data do pedido', with: Faker::Date.backward(150))
      fill_in('Vencimento', with: Faker::Date.backward(100))
      select('GAO', from: 'Fornecedor')
      fill_in('Valor', with: '230,00')
      select('Cheque', from: 'Tipo de pagamento')
    end
    click_button('Salvar')

    expect(page).to have_content(:all, "criado com sucesso!")
  end

  scenario 'Edits a master_order' do # Happy Path
    master_order
    visit(edit_accounting_master_order_path(master_order.id))

    select('Março', from: 'master_order_date_2i')
    click_button('Salvar')

    expect(page).to have_content(:all, 'atualizado com sucesso!')
  end

  scenario 'Destroy a master_order', js: true do
    master_order

    visit(accounting_master_orders_path)
    find('.typcn.typcn-times.basic-color').click
    1.second
    page.driver.browser.switch_to.alert.accept

    expect(page).to have_content(:all, "excluído com sucesso!")
  end

end
