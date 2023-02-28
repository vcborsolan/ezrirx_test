class BuyerController < ApplicationController
    before_action :authorize_request
    before_action :ensure_only_sellers

    def index
        @products = Product.all
        render json: @products, status: :success
    end
end
