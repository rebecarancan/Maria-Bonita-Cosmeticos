require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe 'as Logged User' do
    let(:user) { create :user }
    let!(:product) { create :product }

    it 'Route' do
      is_expected.to route(:get, '/products').to(action: :index)
    end

    it 'responds successfully' do
      sign_in user
      get :index, params: { id: user.id }
      expect(response).to have_http_status(200)
    end

    it 'Creates successfully' do
      product_params = attributes_for(:product)
      sign_in user

      expect{post :create, params: { product: product_params }}.to change{Product.count}.by(1)
    end

    it 'Destroys successfully' do
      sign_in user
      expect{delete :destroy, params: { id: product.id }}.to change{Product.count}.by(-1)
    end

    it 'responds successfully to edit' do
      sign_in user
      get :edit, params: { id: product.id }
      expect(response).to have_http_status(200)
    end
  end
end
