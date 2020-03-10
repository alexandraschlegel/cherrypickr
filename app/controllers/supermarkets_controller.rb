class SupermarketsController < ApplicationController
  def show

    @supermarket = Supermarket.find (params[:id])
    @markers =
      [{
        lat: @supermarket.latitude,
        lng: @supermarket.longitude
      }]

  end
end
