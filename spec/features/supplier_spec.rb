require 'rails_helper'

feature "Suppliers", type: :feature, js: true do

  let!(:user) { create :user }
  let! (:login) { login_as(user, :scope => :user) }
  let!(:supplier) { create :supplier }

  scenario 'Verify new supplier link' do
    visit(accounting_suppliers_path)
    expect(page).to have_link('Novo')
  end

  scenario 'Creates a new supplier' do
    visit(new_accounting_supplier_path)
    supplier_name = Faker::Company.name

    fill_in('Nome', with: supplier_name)
    click_button('Salvar')

    expect(Supplier.last.name).to eq(supplier_name)
    expect(page).to have_content('criado com sucesso!')
  end

  scenario 'Creates an invalid supplier ' do
    visit(new_accounting_supplier_path)

    click_button('Salvar')

    expect(page).to have_content('não pode ficar em branco')
  end

  scenario 'Verify edit supplier form' do
    visit(accounting_suppliers_path)
    find('.typcn.typcn-pencil.basic-color').click

    expect(page).to have_content('Editando Fornecedor')
  end

  scenario 'Edits a supplier' do
    new_name = Faker::Company.name
    visit(edit_accounting_supplier_path(supplier.id))

    fill_in('Nome', with: new_name)
    click_button('Salvar')

    expect(page).to have_content('atualizado com sucesso!')
    expect(page).to have_content(new_name)
  end

  scenario 'Creates a new supplier' do
    visit(new_accounting_supplier_path)
    supplier_name = Faker::Company.name

    fill_in('Nome', with: supplier_name)
    click_button('Salvar')

    expect(page).to have_content("criado com sucesso!")
    expect(Supplier.last.name).to eq(supplier_name)
  end

  scenario 'Destroy a supplier', js: true do

    visit(accounting_suppliers_path)
    find('.typcn.typcn-times.basic-color').click
    1.second
    page.driver.browser.switch_to.alert.accept

    expect(page).to have_content("excluído com sucesso!")
  end
end
