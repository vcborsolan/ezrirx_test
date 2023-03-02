require 'rails_helper'

RSpec.describe BuyerController, type: :controller do
  describe 'GET #index' do
    context 'when user is a buyer' do
      let(:buyer) { FactoryBot.create(:buyer, state: 'California') }
      let(:buyer_token) { JsonWebToken.encode(user_id: buyer.id) }
      let!(:product1) { 
        FactoryBot.create(:seller_product, price: 10,
             user_id: FactoryBot.create(:seller, state: 'California').id)
             }
      let!(:product2) { 
        FactoryBot.create(:seller_product, price: 20,
             user_id: FactoryBot.create(:seller, state: 'California').id) 
            }
      let!(:product3) { 
        FactoryBot.create(:seller_product, price: 30,
             user_id: FactoryBot.create(:seller, state: 'New York').id)
             }

      before do
        request.headers['Authorization'] = "Bearer #{buyer_token}"
        get :index
      end

      it 'returns a success response' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns the products ordered by price' do
        expect(assigns(:products)).to eq([product1, product2])
      end

      it 'does not return products from other states' do
        expect(assigns(:products)).not_to include(product3)
      end

      it 'renders JSON response' do
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end

    context 'when user is a seller' do
      let(:seller) { FactoryBot.create(:seller) }
      let(:seller_token) { JsonWebToken.encode(user_id: seller.id) }

      before do
        request.headers['Authorization'] = "Bearer #{seller_token}"
        get :index
      end

      it 'redirects to seller product index page' do
        expect(response).to redirect_to(seller_product_index_path)
      end
    end
  end
end