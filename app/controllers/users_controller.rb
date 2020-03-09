class UsersController < ApplicationController

  def show
    @user = current_user
    @products = @user.products
  end


  def edit
    @user = current_user
  end

  def update
    @user = User.update(user_params)
    if @user.first.save
      redirect_to user_path(current_user)
    else
      flash[:alert] = @user.first.errors.full_messages.join(' ')
      redirect_to user_path(current_user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:location, :distance)
  end
end
