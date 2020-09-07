class UsersController < ApplicationController
  def show
    user              = User.find(params[:id])
    @nickname         = user.nickname
    @tweets_user_show = user.tweets
  end
end
