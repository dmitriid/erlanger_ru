# coding: utf-8
CACHE_EVERY_SEC = 300

class WelcomeController < ApplicationController
  def index
    @frontpage_news = News.all
    @frontpage_events = Event.all
    @tweets = get_tweets
  end

  protected
  def get_tweets
    lang = I18n.locale.to_s
    tweet_time_slice = Time.now.seconds_since_midnight().round / CACHE_EVERY_SEC
    cached_tweets_key = 'tweets_' + lang
    cached_at_key = 'tweets_cached_at_' + lang
    cached_tweets = Rails.cache.read(cached_tweets_key)
    cached_at     = Rails.cache.read(cached_at_key)
    if cached_tweets == nil ||
        (cached_at < tweet_time_slice &&
            (tweet_time_slice - cached_at) > (43200 / CACHE_EVERY_SEC)
        ) then
      t = Twitter.search(twitter_query_by_lang(lang),
                         :lang => tweet_lang_by_locale(lang),
                         :count => 5).results
      Rails.cache.write(cached_tweets_key, t)
      Rails.cache.write(cached_at_key, tweet_time_slice)
      return t
    end
    return cached_tweets
  end

  def tweet_lang_by_locale(lang)
    if lang == "ua" then
      return "ru"
    end
    return lang
  end

  def twitter_query_by_lang(lang)
    if lang == "ru" then
      return "#erlang OR эрланг -rt"
    end
    if lang == "ua" then
      return "#erlang OR эрланг OR ерланг -rt"
    end
    return "#erlang -rt"
  end
end
