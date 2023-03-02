class SellerProduct < ApplicationRecord
  belongs_to :seller, foreign_key: 'user_id'
  belongs_to :product

  def self.by_seller_state(state)
    joins(:seller)
      .where(seller: { state: state })
  end
end
