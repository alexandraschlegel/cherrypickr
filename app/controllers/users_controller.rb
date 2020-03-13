class UsersController < ApplicationController

  def show
    @user = current_user
    @products = @user.products
    @branches = Branch.all
    @markers = @branches.map do |branch|
      {
        longitude: branch.longitude,
        latitude: branch.latitude
      }
    end
    if params[:query].present?
      if params[:query].match?(/\d/)

        @branches = Branch.near(params[:query], 500)

        if @branches.any?
          @markers = @branches.map do |branch|
            {
              longitude: branch.longitude,
              latitude: branch.latitude
            }
          end
        end

      elsif ["Tesco", "Waitrose", "Sainsburys"].include?(params[:query])
          @branches = Supermarket.where(name: params[:query]).first.branches

          Branch.near(current_user.location, 500)
          if @branches.any?
            @markers = @branches.map do |branch|
              {
                longitude: branch.longitude,
                latitude: branch.latitude
              }
            end
          end
      else
        flash[:alert] = "No Supermarket by that name!"
      end
    end
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
