FactoryBot.define do
    factory :product do
      sequence(:sku) { |n| "sku-#{n}" }
      name { Faker::Commerce.product_name }
      description { "A cool product description" }
    end
  end