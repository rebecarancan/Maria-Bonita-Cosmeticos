require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  it 'responds successfully' do
    sign_in user
    get :index, params: { id: user.id }
    expect(response).to have_http_status(200)
  end
end
