class SellerProductController < ApplicationController
    before_action :authorize_request
    before_action :ensure_only_sellers

    def index
        @seller_products = @current_user.seller_products
    end

    def new
        @seller_product = SellerProduct.new
    end

    def create
        @seller_product = SellerProduct.new(seller_product_params)
        @seller_product.seller = @current_user
    
        if @seller_product.save
          redirect_to seller_product_path, notice: "Seller product was successfully created."
        else
          render :new
        end
    end
    
    def edit
        @seller_product = @current_user.seller_products.find(params[:id])
    end

    def update
        @seller_product = @current_user.seller_products.find(params[:id])

        if @seller_product.update(seller_product_params)
            redirect_to seller_product_path, notice: "Seller product was successfully updated."
        else
            render :edit
        end
    end

    def destroy
        @seller_product = @current_user.seller_products.find(params[:id])
        @seller_product.destroy
    
        redirect_to seller_product_path, notice: "Seller product was successfully deleted."
    end
    
    private
    
    def seller_product_params
        params.require(:seller_product).permit(:product_id, :price, :quantity)
    end
end
