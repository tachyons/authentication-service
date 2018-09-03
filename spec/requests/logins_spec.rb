require 'rails_helper'

RSpec.describe 'Login', type: :request do
  context 'with valid credentials' do
    before do
      @user = create(:user, email: 'test@example.com', password: 'pass@word')
    end

    it 'Responds token' do
      post sessions_path, params: { email: 'test@example.com', password: 'pass@word' }
      expect(response).to have_http_status(200)
    end

    it 'Token received is valid' do
      post sessions_path, params: { email: 'test@example.com', password: 'pass@word' }, as: :json
      token = response.parsed_body['auth_token']
      payload = JWT.decode(token, JsonWebToken.public_key, true, algorithm: 'RS256')[0]
      expect(payload['user_id']).to be_eql(@user.id) # rubocop:disable RSpec/InstanceVariable
    end

    context 'with invalid credentials' do
      it 'respond authentication error' do
        post sessions_path, params: { email: 'test@example.com', password: 'password' }
        expect(response).to have_http_status(401)
      end
    end
  end
end
