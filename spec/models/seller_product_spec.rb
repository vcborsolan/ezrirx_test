require 'rails_helper'

RSpec.describe SellerProduct, type: :model do
  let(:seller1) { FactoryBot.create(:seller, state: 'California') }
  let(:seller2) { FactoryBot.create(:seller, state: 'New York') }
  let(:product) { FactoryBot.create(:product) }

  describe '.by_seller_state' do
    it 'returns seller products by state' do
      FactoryBot.create(:seller_product, user_id: seller1.id, product:)
      FactoryBot.create(:seller_product, user_id: seller2.id, product:)
      seller_product = SellerProduct.by_seller_state('California')

      expect(seller_product.first.seller).to eq seller1
      expect(seller_product.size).to eq 1
      expect(seller_product.first.product).to eq product
    end
  end
end
