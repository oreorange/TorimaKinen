class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @events = Event.where(user_id: @user.id)
    @event = Event.new
    # binding.pry
  end

  def edit
  end

  private
  def user_params
      params.require(:user).permit(:name)
  end

end
