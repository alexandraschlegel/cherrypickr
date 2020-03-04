class ProductsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index]

  def index
    if params[:query].present?
      @products = Product.search_by_title(params[:query])
    else
      @products = Product.all
    end
  end

  def show
    @product = Product.find (params[:id])


  end
end
