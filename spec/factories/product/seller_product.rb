FactoryBot.define do
    factory :seller_product do
      association :user, factory: :seller
      association :product, factory: :product
      price { Faker::Commerce.price }
      quantity { Faker::Base.rand_in_range(1, 10) }
    end
end