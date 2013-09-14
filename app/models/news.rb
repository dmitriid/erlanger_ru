class News < ActiveRecord::Base
  has_many :i18n_news

  def get_tags
    lang = I18n.locale.to_s
    NewsTag.includes(:tag).where("tags.lang_iso639" => lang).to_a
  end
end
