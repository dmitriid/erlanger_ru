# coding: utf-8
CACHE_EVERY_SEC = 300

class WelcomeController < ApplicationController
  def index
    loc = I18n.locale.to_s
    @frontpage_news = Resource::find('news').order('created_at DESC').limit(25)
    @frontpage_events = Resource::find('event')
    @frontpage_articles = Resource::find('article').order('created_at DESC').limit(25)
    @tweets = WelcomeController::get_tweets(loc)
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
