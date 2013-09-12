class WelcomeController < ApplicationController
  def index
    @frontpage_news = News.all
    @frontpage_events = Event.all
    @tweets = get_tweets
  end

  protected
  def get_tweets
    lang = params[:locale]
    tweet_time_slice = Time.now.seconds_since_midnight().round / 300
    cached_tweets_key = 'tweets_' + lang
    cached_at_key = 'tweets_cached_at_' + lang
    cached_tweets = Rails.cache.read(cached_tweets_key)
    cached_at     = Rails.cache.read(cached_at_key)
    if cached_tweets == nil || cached_at < tweet_time_slice then
      t = Twitter.search("#erlang -rt",
                         :lang => lang,
                         :count => 5).results
      Rails.cache.write(cached_tweets_key, t)
      Rails.cache.write(cached_at_key, tweet_time_slice)
      return t
    end
    return cached_tweets
  end
end
