class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  def create
    current_user.follow(params[:user_id])
    # js.erbに渡すuser.id
    @user = User.find(params[:user_id])
    # redirect_to request.referer 非同期化のため消す
  end

  def destroy
    current_user.unfollow(params[:user_id])
    @user = User.find(params[:user_id])
    # redirect_to request.referer 非同期化のため消す
  end

  def followings
     user = User.find(params[:user_id])
     @users = user.followings
  end

  def followers
     user = User.find(params[:user_id])
     @users = user.followers
  end
  
  # フォロー数、カウント用
  def follower_counts
     @user = User.find(params[:user_id])

  end

end
