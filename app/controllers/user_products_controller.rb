class UserProductsController < ApplicationController

    def new
    @product = Product.find(params[:product_id])
    @user = current_user
  end

  def create
  end

end
