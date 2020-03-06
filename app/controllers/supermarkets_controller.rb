class SupermarketsController < ApplicationController
  def show
    @supermarket = Supermarket.find (params[:id])



    @markers = {  lat: @supermarket.latitude,
                  lon: @supermarket.longitude
               }
  end
end
