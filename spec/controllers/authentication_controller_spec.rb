require 'rails_helper'

RSpec.describe AuthenticationController, type: :controller do
  describe 'POST #login' do
    let!(:user) { FactoryBot.create(:buyer, email: 'test@example.com', password: 'password') }
    let(:login_params) { { email: 'test@example.com', password: 'password' } }

    context 'when valid login params are passed' do
      before { post :login, params: login_params }

      it 'returns a JWT token' do
        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)['token']).not_to be_nil
      end

      it 'returns an expiration time' do
        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)['exp']).not_to be_nil
      end

      it 'returns the username of the logged in user' do
        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)['username']).to eq(user.username)
      end
    end

    context 'when invalid login params are passed' do
      before { post :login, params: { email: 'test@example.com', password: 'invalid_password' } }

      it 'returns an unauthorized error' do
        expect(response).to have_http_status(:unauthorized)
        expect(JSON.parse(response.body)['error']).to eq('unauthorized')
      end
    end
  end
end
