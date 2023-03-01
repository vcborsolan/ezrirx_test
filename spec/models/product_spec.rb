require 'rails_helper'

RSpec.describe Product, type: :model do
    let(:product) { FactoryBot.create(:product) }
  
    describe 'validations' do
      it 'is valid with valid attributes' do
        expect(product).to be_valid
      end
  
      it { should validate_presence_of(:sku) }
      it { should validate_uniqueness_of(:sku) }
    end
  
    describe 'associations' do
      it { should have_many(:seller_products) }
    end
  end