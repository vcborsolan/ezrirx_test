class BuyerController < ApplicationController
    before_action :authorize_request

    def index
        return redirect_to seller_product_index_path if @current_user.type == 'seller'
        @products = SellerProduct.by_seller_state(@current_user.state).order(price: :asc)
        render json: @products, status: :success
    end
end
