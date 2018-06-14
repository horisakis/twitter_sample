class HomesController < ApplicationController
  def top
    if current_user
      @client = Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV['TWITTER_KEY']
        config.consumer_secret     = ENV['TWITTER_SECRET']
        config.access_token        = @current_user.tw_token
        config.access_token_secret = @current_user.tw_token_secret
      end
    end
  end
end
