# coding: utf-8
CACHE_EVERY_SEC = 300

class WelcomeController < ApplicationController
  def index
    @frontpage_news = NewsController::get_news(I18n.locale.to_s)
    @frontpage_events = EventsController::get_events(I18n.locale.to_s)
    @tweets = get_tweets
  end

  protected
  def get_tweets
    Rails.cache.read(tweet_key_by_locale()) || []
  end

  def tweet_key_by_locale()
    lang = I18n.locale.to_s
    lang = "ru" if lang == "ua"
    'tweets_' + lang
  end
end
