require 'rails_helper'

feature "MasterFinances", type: :feature, js: true do

  let!(:user) { create :user }
  let! (:login) { login_as(user, :scope => :user) }
  let!(:income_type) { create :income_type }
  let!(:expense_type) { create :expense_type }
  let(:master_finance) { create :master_finance }

  scenario 'Creates the first master_finance' do
    visit(new_accounting_master_finance_path)

    select('Fevereiro', from: 'master_finance_date_2i')
    fill_in('Saldo Inicial', with: '100,00')

    click_button('Salvar')

    expect(page).to have_content("criada com sucesso!")
  end

  scenario 'Creates a new master_finance' do
    master_finance
    visit(new_accounting_master_finance_path)

    select('Fevereiro', from: 'master_finance_date_2i')

    click_button('Salvar')

    expect(page).to have_content("criada com sucesso!")
  end

  scenario 'Creates a master_finance_with_finances' do
    master_finance
    visit(new_accounting_master_finance_path)

    select('Fevereiro', from: 'master_finance_date_2i')
    click_link('+')
    within('.nested-fields') do
      fill_in('Data', with: Faker::Date.backward(150))
      select('Dinheiro', from: 'Entrada')
      fill_in('Descrição', with: 'teste' )
      fill_in('Valor', with: '100,00')
    end

    click_link('+')
    within('.nested-fields:nth-child(2)') do
      fill_in('Data', with: Faker::Date.backward(150))
      select('Limpeza', from: 'Saída')
      fill_in('Descrição', with: 'teste2' )
      fill_in('Valor', with: '102,00')
    end
    click_button('Salvar')

    expect(page).to have_content("criada com sucesso!")
  end

  scenario 'Edits a master_finance' do
    visit(edit_accounting_master_finance_path(master_finance.id))

    select('Fevereiro', from: 'master_finance_date_2i')
    click_button('Salvar')

    expect(page).to have_content('atualizada com sucesso!')
  end

  scenario 'Destroy a master_finance', js: true do
    master_finance

    visit(accounting_master_finances_path)
    find('.typcn.typcn-times.basic-color').click
    1.second
    page.driver.browser.switch_to.alert.accept

    expect(page).to have_content("excluída com sucesso!")
  end

end
