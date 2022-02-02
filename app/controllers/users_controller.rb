class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @events = Event.where(user_id: @user.id)
    @event = Event.new
    # おすすめ記念日ランダム表示・RANDOM本番環境でエラー
    # @random = Event.order("RANDOM()").limit(7)
    @random = Event.all.sample(7)
    # binding.pry
  end
  
  def index
    @users = User.all
  end

  def edit
    @user = current_user
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :birthday, :introduction, :image)
  end

end
