require 'rails_helper'

feature "Home", type: :feature, js: true do

  let!(:user) { create :user }

  scenario 'Verify log in form' do
    visit(home_index_path)
    expect(page).to have_content(:all, 'Entrar')
  end

  scenario 'Valid log in', js: true do
    visit(home_index_path)

    fill_in('Email', with: 'admin@admin.com')
    fill_in('Senha', with: '123456')
    click_on('Entrar')

    expect(page).to have_content(:all, 'Maria Bonita')
    # expect(page).to have_content(:all, 'Login efetuado com sucesso')
  end

  scenario 'Invalid login' do
    visit(home_index_path)

    fill_in('Email', with: 'user@user.com')
    fill_in('Senha', with: '123456')
    click_on('Entrar')

    expect(page).to have_content(:all, 'Invalido Email ou senha')
  end
end
