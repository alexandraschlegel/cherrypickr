class ProductsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index]

  def index
    if params[:product].present?
      @products = Product.where("name ILIKE ?", "%#{params[:product]}%")

    else
      @products = Product.all
    end
  end

  def show
    @product = Product.find (params[:id])


  end
end
