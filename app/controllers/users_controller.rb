class UsersController < ApplicationController
  def show
    @nickname         = current_user.nickname
    @tweets_user_show = current_user.tweets
  end
end
