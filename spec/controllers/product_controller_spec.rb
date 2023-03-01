require 'rails_helper'

RSpec.describe ProductController, type: :controller do
  describe 'GET index' do
    let!(:product) { FactoryBot.create(:product) }
    let!(:seller) { FactoryBot.create(:seller) }
    let(:token) { JsonWebToken.encode(user_id: seller.id) }

    context 'when authorized seller makes request' do
      before do
        request.headers['Authorization'] = "Bearer #{token}"
        get :index
      end

      it 'returns a 200 status code' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns the correct number of products' do
        expect(JSON.parse(response.body).size).to eq(1)
      end
    end

    context 'when unauthorized buyer makes request' do
      let(:buyer) { FactoryBot.create(:buyer) }
      let(:token) { JsonWebToken.encode(user_id: buyer.id) }

      before do
        request.headers['Authorization'] = "Bearer #{token}"
        get :index
      end

      it 'returns a 401 status code' do
        expect(response).to have_http_status(:unauthorized)
      end

      it 'returns an error message' do
        expect(JSON.parse(response.body)['error']).to eq('Access denied')
      end
    end
  end
end
