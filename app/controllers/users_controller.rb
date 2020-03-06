class UsersController < ApplicationController
  def show
    @user = current_user
    @products = @user.products
  end
end
