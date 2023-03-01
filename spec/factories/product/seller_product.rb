FactoryBot.define do
    factory :seller_product do
      seller { create(:seller) }
      product { create(:product) }
      price { Faker::Commerce.price }
      quantity { Faker::Base.rand_in_range(1, 10) }
    end
end