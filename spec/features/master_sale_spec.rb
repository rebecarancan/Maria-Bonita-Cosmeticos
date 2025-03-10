require 'rails_helper'

feature "MasterSales", type: :feature, js: true do

  let!(:user) { create :user }
  let! (:login) { login_as(user, :scope => :user) }
  let!(:income_type) { create :income_type }
  let!(:master_sale) { create :master_sale }

  scenario 'Creates a new master_sale' do
    visit(new_accounting_master_sale_path)

    select('abril', from: 'master_sale_date_2i')
    click_button('Salvar')

    expect(page).to have_content(:all, "criada com sucesso!")
  end

  scenario 'Creates a master_sale_with_sales' do
    visit(new_accounting_master_sale_path)

    select('abril', from: 'master_sale_date_2i')
    click_link('Adicionar')
    within('.nested-fields') do
      fill_in(with: Faker::Date.backward(days: 150), class: 'date-field')
      find('select.income-field').find(:option, text: 'Dinheiro').select_option
      fill_in(with: '150,00', class: 'value-field')
    end

    click_button('Salvar')

    expect(page).to have_content(:all, "criada com sucesso!")
  end

  scenario 'Edits a master_sale' do
    visit(edit_accounting_master_sale_path(master_sale.id))

    select('abril', from: 'master_sale_date_2i')
    click_button('Salvar')

    expect(page).to have_content(:all, 'atualizada com sucesso!')
  end

  scenario 'Destroy a master_sale', js: true do

    visit(accounting_master_sales_path)
    find('.typcn.typcn-times.basic-color').click
    1.second
    page.driver.browser.switch_to.alert.accept

    expect(page).to have_content(:all, "excluída com sucesso!")
  end

end
