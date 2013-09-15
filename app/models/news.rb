class News < ActiveRecord::Base
  has_many :i18n_news

  def get_tags
    lang = I18n.locale.to_s
    NewsTag.includes(:tag).where("tags.lang_iso639" => lang).to_a
  end

  include LinkableMaterial
  def linkable_material_type
    RESTYPE[:news]
  end

  def to_s
    lang = I18n.locale.to_s
    i18n_news.where("i18n_news.lang_iso639" => lang).first.title
  end
end
