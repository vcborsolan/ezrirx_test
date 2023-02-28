class SellerProduct < ApplicationRecord
  belongs_to :user
  belongs_to :product

  def self.by_seller_state(state)
    joins(:seller)
      .where(sellers: { state: state })
  end
end
