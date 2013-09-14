class News < ActiveRecord::Base
  has_many :i18n_news
  has_many :news_tags
  has_many :tags, :through => :news_tags
end
