require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'Create user' do
    it 'Creates user record' do
      expect do
        post users_path, params: { user: { name: 'John Doe', email: 'john@doe.com', password: 'superS3cret' } }
      end.to change(User, :count).by(1)
      expect(response).to have_http_status(200)
    end
  end

  describe 'Get logged in user details' do
    let(:user) { create(:user) }

    it 'returns user record' do
      get me_users_path, headers: valid_headers, as: :json
      expect(response).to have_http_status(200)
    end
  end
end
