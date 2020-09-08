class TweetsController < ApplicationController
  # before_action :set_tweet, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show, :search]
  


  def index
    # @tweets_index = Tweet.all
    @tweets_index = Tweet.includes(:user).order("created_at DESC").page(params[:page]).per(3)
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

  def edit
    @tweet_edit = Tweet.find(params[:id])
  end

  def update
    tweet_update = Tweet.find(params[:id])
    tweet_update.update(tweet_params)
    # redirect_to root_path
  end

  def show
    @tweet_show = Tweet.find(params[:id])

    @comment = Comment.new
    @comments = @tweet_show.comments.includes(:user)
  end

  def search
    @tweets = Tweet.search(params[:keyword])
  end

  private
  def tweet_params
    # params.require(:tweet).permit(:name, :text, :image)
    # params.require(:tweet).permit(:name, :text, :image).merge(user_id: current_user.id)
    params.require(:tweet).permit(:text, :image).merge(user_id: current_user.id)
  end

  # def set_tweet
  #   @tweet = Tweet.find(params[:id])
  # end
  
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
