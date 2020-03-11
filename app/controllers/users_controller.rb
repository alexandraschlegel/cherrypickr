class UsersController < ApplicationController

  def show
    @user = current_user
    @products = @user.products

    if !params[:query].nil?
      if params[:query].match?(/\d/)
        @branches = Branch.near(params[:query], 5)
        if @branches.any?
          @markers = @branches.map do |branch|
            # if branch.longitude.nil? || branch.latitude.nil?
            {
              longitude: branch.longitude,
              latitude: branch.latitude
            }
          end
        end
    else
      if params[:query].present? && ["Tesco", "Waitrose", "Sainsburys"].include?(params[:query])
        @branches = Supermarket.where(name: params[:query]).first.branches
        # raise
        Branch.near(current_user.location, 1)
        if @branches.any?
          @markers = @branches.map do |branch|
            # if branch.longitude.nil? || branch.latitude.nil?
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
