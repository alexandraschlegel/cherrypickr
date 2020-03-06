class ProductsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index]

  def index
    if params[:product].present?
      @products = Product.where("name ILIKE ?", "%#{params[:product]}%").group_by{|p| p.name}

    else
      @products = Product.all.group_by{|p| p.name}
    end
  end

  def show
    @product = Product.find (params[:id])
    @other_ones = Product.where(name: @product.name).reject{|r| r == @product}
  end

end
