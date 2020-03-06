class SupermarketsController < ApplicationController
  def show
    @Supermarket = Supermarket.find (params[:id])
  end

end
