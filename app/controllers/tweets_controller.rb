class TweetsController < ApplicationController
  def index
    @tweets_index = Tweet.all
  end

  def new
    @tweets_new   = Tweet.new
  end

  def create
    # binding.pry
    Tweet.create(tweet_params)
  end


  private
  def tweet_params
    params.require(:tweet).permit(:name, :text, :image)
  end
end
