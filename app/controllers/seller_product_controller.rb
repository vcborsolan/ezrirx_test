class SellerProductController < ApplicationController
    before_action :authorize_request
    before_action :ensure_only_sellers
    before_action :block_cross_seller_update, only: %i[update destroy]

    def index
        @seller_products = @current_user.seller_products
    end

    def create
        @seller_product = SellerProduct.new(seller_product_params)
        @seller_product.user_id = @current_user.id
    
        if @seller_product.save
          render json: @seller_product, status: :created
        else
          render json: { error: @seller_product.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def update
        if @seller_product.update(seller_product_params)
            redirect_to seller_product_path
        else
            render json: @seller_product.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        @seller_product.destroy
    
        render json: { notice: 'Seller product was successfully deleted.' }, status: :ok
    end
    
    private
    
    def seller_product_params
        params.require(:seller_product).permit(:product_id, :price, :quantity)
    end

    def block_cross_seller_update
        target = SellerProduct.find(params[:id])
        render json: { error: 'Access denied' }, status: :unauthorized if target.user_id != @current_user.id
        @seller_product = target
    end
end
