# coding: utf-8
CACHE_EVERY_SEC = 300

class WelcomeController < ApplicationController
  def index
    @frontpage_news = NewsController::get_news(I18n.locale.to_s)
    @frontpage_events = EventsController::get_events(I18n.locale.to_s)
    @tweets = WelcomeController::get_tweets(I18n.locale.to_s)
  end

protected
  # static
  def self.get_tweets(lang)
    Rails.cache.read(WelcomeController::tweet_key_by_locale(lang)) || []
  end

  # static
  def self.tweet_key_by_locale(lang)
    lang = lang
    lang = "ru" if lang == "ua"
    'tweets_' + lang
  end
end
