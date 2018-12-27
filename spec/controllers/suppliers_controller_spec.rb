require 'rails_helper'

RSpec.describe Accounting::SuppliersController, type: :controller do
  describe 'as Logged User' do
    let(:user) { create :user }
    let!(:supplier) { create :supplier }

    it 'Route' do
      is_expected.to route(:get, '/accounting/suppliers').to(action: :index)
    end

    it 'responds successfully' do
      sign_in user
      get :index, params: { id: user.id }
      expect(response).to have_http_status(200)
    end

    it 'Creates successfully' do
      supplier_params = attributes_for(:supplier)
      sign_in user


      expect{post :create, params: { supplier: supplier_params }}.to change{Supplier.count}.by(1)
    end

    it 'Destroys successfully' do
      sign_in user
      expect{delete :destroy, params: { id: supplier.id }}.to change{Supplier.count}.by(-1)
    end

    it 'responds successfully to edit' do
      sign_in user
      get :edit, params: { id: supplier.id }
      expect(response).to have_http_status(200)
    end
  end
end
