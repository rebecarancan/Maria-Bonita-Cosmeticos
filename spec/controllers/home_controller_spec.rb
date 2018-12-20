require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'as Logged User' do
    before do
      @user = create(:user)
    end

    it 'responds successfully' do
      sign_in @user
      get :index, params: { id: @user.id }
      expect(response).to have_http_status(200)
    end
  end

  describe 'as user not logged' do

    it 'responds unauthorized' do
      get :index
      expect(response).to have_http_status(302)
    end
  end
end
