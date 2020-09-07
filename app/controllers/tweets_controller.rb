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

  def destroy
    tweet_delete = Tweet.find(params[:id])
    tweet_delete.destroy
    # redirect_to root_path
  end


  private
  def tweet_params
    params.require(:tweet).permit(:name, :text, :image)
  end
end
