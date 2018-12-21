require 'rails_helper'

feature "MasterNotes", type: :feature, js: true do

  before do
    user = create(:user)
    login_as(user, :scope => :user)
  end

  scenario 'Creates a new master_note' do # Happy Path
    visit(new_accounting_master_note_path)

    find(:xpath, "/html/body/form[@class='basic-grey']/div[@class='form-row'][1]/div[@class='col-md-2 mb-10']/select[@id='master_note_date_2i']").select('Fevereiro')
    click_button('Salvar')

    expect(page).to have_content("criada com sucesso!")
  end

  # scenario 'Creates a master_note_with_notes' do # Happy Path
  #   visit(new_accounting_master_note_path)

  #   find(:xpath, "/html/body/form[@class='basic-grey']/div[@class='form-row'][1]/div[@class='col-md-2 mb-10']/select[@id='master_note_date_2i']").select('Fevereiro')
  #   find(:xpath, "/html/body/form[@class='basic-grey']/div[@id='notes']/div[@class='links']/a[@class='badge badge-pill badge-secondary add_fields']").click
  #   fill_in('Data', with: Faker::Date.backward(150))
  #   select('GAO', from: 'Fornecedor')
  #   fill_in('Valor', with: Faker::Commerce.price)
  #   click_button('Salvar')

  #   expect(page).to have_content("criada com sucesso!")
  # end

  scenario 'Edits a master_note' do # Happy Path
    master_note = create(:master_note)
    visit(edit_accounting_master_note_path(master_note.id))

    find(:xpath, "/html/body/form[@class='basic-grey']/div[@class='form-row'][1]/div[@class='col-md-2 mb-10']/select[@id='master_note_date_2i']").select('Fevereiro')
    click_button('Salvar')

    expect(page).to have_content('atualizada com sucesso!')
  end

  scenario 'Destroy a master_note', js: true do
    master_note = create(:master_note)

    visit(accounting_master_notes_path)
    find(:xpath, "/html/body/div[@class='container-table100']/div[@class='wrap-table100']/div[@class='table100']/table/tbody/tr[1]/td[@class='column5'][3]/a/span[@class='typcn typcn-times basic-color']").click
    1.second
    page.driver.browser.switch_to.alert.accept

    expect(page).to have_content("excluída com sucesso!")
  end

end
