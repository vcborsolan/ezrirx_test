class Product < ApplicationRecord
    validates :sku, presence: true, uniqueness: true
    has_many :seller_products
end
