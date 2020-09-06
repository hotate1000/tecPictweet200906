class TweetsController < ApplicationController
  def index
    @tweets_index = Tweet.all
  end
end
