class UserProductsController < ApplicationController

  def new
  end

  def create
    @user_product = UserProduct.create(user_product_params)
    @user_product.user = current_user
    if @user_product.save
      flash[:notice] = "Successfully added to your Watchlist!"
    else
      flash[:error] = "Sorry, that didnt quite work!"
    end
    redirect_to product_path(@user_product.product)
  end

  def user_product_params
    params.require(:user_product).permit(:product_id)
  end
end
