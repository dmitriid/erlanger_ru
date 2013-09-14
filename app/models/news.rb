class News < ActiveRecord::Base
  has_many :i18n_news
  #has_many :news_tags
  #has_many :tag, :through => :news_tags
  #belongs_to :news_tags
  #belongs_to :tag

  def get_tags
    lang = I18n.locale.to_s
    NewsTag.includes(:tag).where("tags.lang_iso639" => lang).to_a
    #n.tags = NewsTag.includes(:tags).where("tags.lang_iso639" => lang).to_a
  end
end
