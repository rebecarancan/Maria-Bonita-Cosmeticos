require 'rails_helper'

feature "MasterOrders", type: :feature, js: true do

  let!(:user) { create :user }
  let! (:login) { login_as(user, :scope => :user) }
  let!(:supplier) { create :supplier }
  let!(:master_order) { create :master_order }

  scenario 'Creates a new master_order' do # Happy Path
    visit(new_accounting_master_order_path)

    select('março', from: 'master_order_date_2i')
    click_button('Salvar')

    expect(page).to have_content(:all, "criado com sucesso!")
  end

  scenario 'Creates a master_order_with_orders' do # Happy Path
    visit(new_accounting_master_order_path)

    select('março', from: 'master_order_date_2i')
    click_link('Adicionar')
    within('.nested-fields') do
      fill_in(with: Faker::Date.backward(days: 150), class: 'purchase-field')
      fill_in(with: Faker::Date.backward(days: 100), class: 'expire-field')
      find('select.supplier-field').find(:option, text: 'GAO').select_option
      fill_in(with: '250,00', class: 'value-field' )
      find('select.payment-field').find(:option, exact_text: 'Dinheiro').select_option
    end

    click_button('Salvar')

    expect(page).to have_content(:all, "criado com sucesso!")
  end

  scenario 'Edits a master_order' do # Happy Path
    master_order
    visit(edit_accounting_master_order_path(master_order.id))

    select('março', from: 'master_order_date_2i')
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
