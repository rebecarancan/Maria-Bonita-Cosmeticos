require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe 'as Logged User' do
    before do
      @user = create(:user)
      @product = create(:product)
    end

    it 'Route' do
      is_expected.to route(:get, '/products').to(action: :index)
    end

    # it 'Flash Notice' do
    #   product_params = attributes_for(:product)

    #   post :create, params: { product: product_params }
    #   expect(flash[:notice]).to match(/criado com sucesso/)
    # end

    it 'Creates successfully' do
      product_params = attributes_for(:product)
      sign_in @user

      post :create, params: { product: product_params }
      expect(response).to have_http_status(:created)
    end

    # it 'with invalid attributes' do
    #   customer_params = attributes_for(:customer, address: nil)
    #   sign_in @member

    #   expect {
    #     post :create, params: { customer: customer_params }
    #   }.not_to change(Customer, :count)
    # end

    it 'responds successfully' do
      sign_in @user
      get :edit, params: { id: @product.id }
      expect(response).to have_http_status(200)
    end

    # it 'render a :show template' do
    #   sign_in @member
    #   get :show, params: { id: @customer.id }
    #   expect(response).to render_template(:show)
    # end
  end
end
