require 'rails_helper'

RSpec.describe SellerProductController, type: :controller do
  let(:seller) { FactoryBot.create(:seller) }
  let(:seller_product) { FactoryBot.create(:seller_product, user_id: seller.id) }
  let(:seller_token) { JsonWebToken.encode(user_id: seller.id) }
  let(:other_seller) { FactoryBot.create(:seller) }
  let(:other_seller_product) { FactoryBot.create(:seller_product, user_id: other_seller.id) }

  before do
    request.headers['Authorization'] = "Bearer #{seller_token}"
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end

    it 'assigns seller products to @seller_products' do
      get :index
      expect(assigns(:seller_products)).to match_array([seller_product])
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      let(:product) { FactoryBot.create(:product) }
      let(:seller_product_params) do
        {
          seller_product: {
            product_id: product.id,
            price: 9.99,
            quantity: 10
          }
        }
      end

      it 'creates a new seller product' do
        expect do
          post :create, params: seller_product_params
        end.to change(SellerProduct, :count).by(1)
      end

      it 'assigns a newly created seller product as @seller_product' do
        post :create, params: seller_product_params
        expect(assigns(:seller_product)).to be_a(SellerProduct)
        expect(assigns(:seller_product)).to be_persisted
      end

      it 'returns created status' do
        post :create, params: seller_product_params
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid parameters' do
      let(:seller_product_params) do
        {
          seller_product: {
            product_id: nil,
            price: nil,
            quantity: nil
          }
        }
      end

      it 'does not create a new seller product' do
        expect do
          post :create, params: seller_product_params
        end.to_not change(SellerProduct, :count)
      end

      it 'returns full error message and status' do
        post :create, params: seller_product_params
        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)['error']).to eq(['Product must exist'])
      end
    end
  end

  describe 'PATCH #update' do
    context 'when the seller product belongs to the current seller' do
      before do
        patch :update, params: { id: seller_product.id, seller_product: { price: 15.99 } }
      end

      it 'updates the seller product with the new attributes' do
        expect(seller_product.reload.price).to eq(15.99)
      end

      it 'redirects to the seller product page with a success notice' do
        expect(response).to redirect_to(seller_product_path)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the seller product and returns a success status' do
      delete :destroy, params: { id: seller_product.id }
      expect(response).to have_http_status(:ok)
      expect(SellerProduct.find_by(id: seller_product.id)).to be_nil
    end

    context 'when attempting to delete cross seller product' do
      it 'returns an unauthorized status' do
        delete :destroy, params: { id: other_seller_product.id }
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
