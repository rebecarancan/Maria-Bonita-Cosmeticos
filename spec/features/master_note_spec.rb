require 'rails_helper'

feature "MasterNotes", type: :feature, js: true do

  let!(:user) { create :user }
  let! (:login) { login_as(user, :scope => :user) }
  let!(:supplier) { create :supplier }
  let!(:master_note) { create :master_note }

  scenario 'Creates a new master_note' do
    visit(new_accounting_master_note_path)

    select('Fevereiro', from: 'master_note_date_2i')
    click_button('Salvar')

    expect(page).to have_content(:all, "criada com sucesso!")
  end

  scenario 'Creates a master_note_with_notes' do
    visit(new_accounting_master_note_path)

    select('Fevereiro', from: 'master_note_date_2i')
    click_link('Adicionar')
    within('.nested-fields') do
      fill_in('Data', with: Faker::Date.backward(150))
      select('GAO', from: 'Fornecedor')
      fill_in('Valor', with: '100,00')
    end

    click_link('Adicionar')
    within('.nested-fields:nth-child(2)') do
      fill_in('Data', with: Faker::Date.backward(150))
      select('GAO', from: 'Fornecedor')
      fill_in('Valor', with: '150,00')
    end
    click_button('Salvar')

    expect(page).to have_content(:all, "criada com sucesso!")
  end

  scenario 'Edits a master_note' do
    visit(edit_accounting_master_note_path(master_note.id))

    select('Fevereiro', from: 'master_note_date_2i')
    click_button('Salvar')

    expect(page).to have_content(:all, 'atualizada com sucesso!')
  end

  scenario 'Destroy a master_note', js: true do
    visit(accounting_master_notes_path)
    find('.typcn.typcn-times.basic-color').click
    1.second
    page.driver.browser.switch_to.alert.accept

    expect(page).to have_content(:all, "excluída com sucesso!")
  end

end
