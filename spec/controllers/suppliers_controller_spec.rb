require 'rails_helper'

RSpec.describe Accounting::SuppliersController, type: :controller do
  describe 'as Logged User' do
    before do
      @user = create(:user)
      @supplier = create(:supplier)
    end

    it 'Route' do
      is_expected.to route(:get, '/accounting/suppliers').to(action: :index)
    end

    it 'responds successfully' do
      sign_in @user
      get :index, params: { id: @user.id }
      expect(response).to have_http_status(200)
    end

    # it 'Creates successfully' do
    #   supplier_params = attributes_for(:supplier)
    #   sign_in @user

    #   post :create, params: { supplier: supplier_params }
    #   expect(response).to have_http_status(200)
    # end

    # it 'Destroys successfully' do
    #   sign_in @user

    #   delete :destroy, params: { id: @supplier.id }
    #   expect(response).to have_http_status(200)
    # end

    it 'responds successfully to edit' do
      sign_in @user
      get :edit, params: { id: @supplier.id }
      expect(response).to have_http_status(200)
    end
  end
end
