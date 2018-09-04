require 'rails_helper'

RSpec.describe 'Keys', type: :request do
  describe 'GET /public_key.pem' do
    it 'Responds public key' do
      get public_key_path
      expect(response).to have_http_status(200)
    end
  end
end
