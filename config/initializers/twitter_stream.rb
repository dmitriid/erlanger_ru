Rails.application.config.after_initialize do
  cyrillic = /\p{Cyrillic}+.*?\.?/ui
  erlang_hash = /#erlang/ui

  TweetStream::Daemon.new('tracker').track('erlang', 'эрланг') do |status|
    if status.text.match(cyrillic) != nil
      update_cached_tweets(:ru, status)
    elsif status.text.match(erlang_hash) != nil
      update_cached_tweets(:en, status)
    end
  end
end


def update_cached_tweets(key, tweet)
  cached_keys = {:ru => 'tweets_ru',
                 :en => 'tweets_en',
                 :ua => 'tweets_ru'
                }

  cached = Rails.cache.read(cached_keys[key]) || []
  cached = [0..cached.size-1]
  cached.prepend(tweet)
  Rails.cache.write(cached_keys[key], cached)
end
