class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @anniversaries = Anniversary.where(user_id: @user.id)
    @anniversary = Anniversary.new
  end

  def edit
  end
  
  private
  def user_params
      params.require(:user).permit(:name)
  end
  
end
