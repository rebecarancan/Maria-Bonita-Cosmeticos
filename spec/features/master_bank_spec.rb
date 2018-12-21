require 'rails_helper'

feature "MasterBanks", type: :feature, js: true do

  before do
    user = create(:user)
    login_as(user, :scope => :user)
  end

  # scenario 'Creates the first master_bank' do # Happy Path
  #   visit(new_accounting_master_bank_path)

  #   find(:xpath, "/html/body/form[@class='basic-grey']/div[@class='form-row'][1]/div[@class='col-md-2 mb-10']/select[@id='master_bank_date_2i']").select('Fevereiro')
  #   fill_in('Saldo Inicial', with: Faker::Commerce.price)

  #   click_button('Salvar')

  #   expect(page).to have_content("criado com sucesso!")
  # end

  scenario 'Creates a new master_bank' do # Happy Path
    master_bank = create(:master_bank)
    visit(new_accounting_master_bank_path)

    find(:xpath, "/html/body/form[@class='basic-grey']/div[@class='form-row'][1]/div[@class='col-md-2 mb-10']/select[@id='master_bank_date_2i']").select('Fevereiro')

    click_button('Salvar')

    expect(page).to have_content("criado com sucesso!")
  end

  # scenario 'Creates a master_bank_with_banks' do # Happy Path
  #   visit(new_accounting_master_bank_path)

  #   find(:xpath, "/html/body/form[@class='basic-grey']/div[@class='form-row'][1]/div[@class='col-md-2 mb-10']/select[@id='master_bank_date_2i']").select('Fevereiro')
  #   find(:xpath, "/html/body/form[@class='basic-grey']/div[@id='banks']/div[@class='links']/a[@class='badge badge-pill badge-secondary add_fields']").click
  #   fill_in('Data', with: Faker::Date.backward(150))
  #   select('Dinheiro', from: 'Entrada')
  #   fill_in('Descrição', with: Faker::Lorem.words(3) )
  #   fill_in('Valor', with: Faker::Commerce.price)
  #   click_button('Salvar')

  #   find(:xpath, "/html/body/form[@class='basic-grey']/div[@id='banks']/div[@class='links']/a[@class='badge badge-pill badge-secondary add_fields']").click
  #   fill_in('Data', with: Faker::Date.backward(150))
  #   select('Limpeza', from: 'Saída')
  #   fill_in('Descrição', with: Faker::Lorem.words(3) )
  #   fill_in('Valor', with: Faker::Commerce.price)
  #   click_button('Salvar')

  #   expect(page).to have_content("criado com sucesso!")
  # end

  scenario 'Edits a master_bank' do # Happy Path
    master_bank = create(:master_bank)
    visit(edit_accounting_master_bank_path(master_bank.id))

    find(:xpath, "/html/body/form[@class='basic-grey']/div[@class='form-row'][1]/div[@class='col-md-2 mb-10']/select[@id='master_bank_date_2i']").select('Fevereiro')
    click_button('Salvar')

    expect(page).to have_content('atualizado com sucesso!')
  end

  scenario 'Destroy a master_bank', js: true do
    master_bank = create(:master_bank)

    visit(accounting_master_banks_path)
    find(:xpath, "/html/body/div[@class='container-table100']/div[@class='wrap-table100']/div[@class='table100']/table/tbody/tr[1]/td[@class='column5'][3]/a/span[@class='typcn typcn-times basic-color']").click
    1.second
    page.driver.browser.switch_to.alert.accept

    expect(page).to have_content("excluído com sucesso!")
  end

end
