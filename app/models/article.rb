class Article < ActiveRecord::Base
  has_many :i18n_articles

  def get_tags
    lang = I18n.locale.to_s
    ArticleTag.includes(:tag).where("tags.lang_iso639" => lang).to_a
  end
end
