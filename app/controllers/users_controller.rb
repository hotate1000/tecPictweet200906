class UsersController < ApplicationController
  def show
    user              = User.find(params[:id])
    @nickname         = user.nickname
    @tweets_user_show = user.tweets.page(params[:page]).order("created_at DESC").per(3)
  end
end
