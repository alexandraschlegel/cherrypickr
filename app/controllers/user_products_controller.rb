class UserProductsController < ApplicationController

    def new
    @product = Product.find(params[:product_id])
    @user = current_user
  end

  def create
  end

  def product_params
    params.require(:product).permit(:name, :supermarket, :address)
  end
  params.require(:user).permit(:product_id)

end
