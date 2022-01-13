class AnniversariesController < ApplicationController
  def create
      anniversary = Anniversary.new(anniversary_params)
      anniversary.save!
      @anniversaries = Anniversary.where(user_id: current_user.id)
  end

  def update
      anniversary = Anniversary.find(params[:id])
      @anniversaries = Anniversary.where(user_id: current_user.id)
      anniversary.update(anniversary_params)
  end

  def destroy
      @user = User.find(params[:id])
      anniversary = Anniversary.find(params[:id])
      anniversary.destroy
      redirect_to user_path(@user)
  end

  private
  def anniversary_params
      params.require(:anniversary).permit(:title, :start, :end, :user_id)
  end

end
