require 'rails_helper'
RSpec.describe FetchUserFromToken do
  context 'when data is invalid' do
    it 'Raise error when empty data is passed' do
      expect { described_class.new(nil).call }.to raise_error(FetchUserFromToken::MissingAuthHeader)
    end

    it 'raise error when token is invalid' do
      expect { described_class.new('blabla').call }.to raise_error(FetchUserFromToken::InvalidToken)
    end

    it 'raise error when token is expired' do
      token = nil
      travel_to(Time.current - 1.month) do
        token = JsonWebToken.encode(user_id: 1)
      end
      expect { described_class.new(token).call }.to raise_error(FetchUserFromToken::InvalidToken)
    end
  end

  context 'when token is valid' do
    let(:user) { create(:user) }

    it 'return user object' do
      token = JsonWebToken.encode(user_id: user.id)
      expect(described_class.new(token).call).to be_eql(user)
    end
  end
end
