class Article < ActiveRecord::Base
  has_many :i18n_articles
  has_many :article_tags
  has_many :tags, :through => :article_tags
end
