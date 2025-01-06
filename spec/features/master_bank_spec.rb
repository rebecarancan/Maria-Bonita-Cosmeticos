require 'rails_helper'

feature "MasterBanks", type: :feature, js: true do

  let!(:user) { create :user }
  let! (:login) { login_as(user, :scope => :user) }
  let!(:income_type) { create :income_type }
  let!(:expense_type) { create :expense_type }
  let(:master_bank) { create :master_bank }

  scenario 'Creates the first master_bank' do
    visit(new_accounting_master_bank_path)

    select('fevereiro', from: 'master_bank_date_2i')
    fill_in('Saldo Inicial', with: '100,00')

    click_button('Salvar')

    expect(page).to have_content(:all, "criado com sucesso!")
  end

  scenario 'Creates a new master_bank' do
    master_bank
    visit(new_accounting_master_bank_path)

    select('fevereiro', from: 'master_bank_date_2i')

    click_button('Salvar')

    expect(page).to have_content(:all, "criado com sucesso!")
  end

  scenario 'Creates a master_bank_with_banks' do
    master_bank
    visit(new_accounting_master_bank_path)

    select('fevereiro', from: 'master_bank_date_2i')
    click_link('Adicionar')
    within('.nested-fields:nth-child(1)') do
      fill_in(with: Faker::Date.backward(150), class: 'date-field')
      find('select.income-field').find(:option, text: 'Dinheiro').select_option
      fill_in(with: 'teste', class: 'description-field' )
      fill_in(with: '100,00', class: 'value-field')
    end

    click_button('Salvar')

    expect(page).to have_content(:all, "criado com sucesso!")
  end

  scenario 'Edits a master_bank' do
    master_bank
    visit(edit_accounting_master_bank_path(master_bank.id))

    select('fevereiro', from: 'master_bank_date_2i')
    click_button('Salvar')

    expect(page).to have_content(:all, 'atualizado com sucesso!')
  end

  scenario 'Destroy a master_bank', js: true do
    master_bank

    visit(accounting_master_banks_path)

    find('.typcn.typcn-times.basic-color').click
    1.second
    page.driver.browser.switch_to.alert.accept

    expect(page).to have_content(:all, "excluído com sucesso!")
  end

end
