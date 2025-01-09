class SubscribersController < ApplicationController
    before_action :check_user_signed_in, only: [:create]
    before_action :set_product
    def create
      # Logic tạo subscriber
      @product.subscribers.where(subscriber_params).first_or_create
      redirect_to @product, notice: "You are now subscribed."
    end
  
    private
  
    def check_user_signed_in
      unless user_signed_in?
        redirect_to new_user_session_path, alert: "You must be signed in to subscribe."
      end
    end
  
    def set_product
      @product = Product.find(params[:product_id])
    end
  
    def subscriber_params
      params.require(:subscriber).permit(:email)
    end
  end
  