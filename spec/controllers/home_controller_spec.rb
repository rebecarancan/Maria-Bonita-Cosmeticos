require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  let(:user) { create :user }

  describe 'as Logged User' do
    it 'responds successfully' do
      sign_in user
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe 'as user not logged' do
    it 'redirects do sign in page' do
      get :index
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
