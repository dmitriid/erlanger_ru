class News < ActiveRecord::Base
  has_many :i18n_news

  def get_tags
    lang = I18n.locale.to_s
    NewsTag.includes(:tag).where("tags.lang_iso639" => lang).to_a
  end

  def self.get_by_lang(args)
    item = News.find(args[:id])
               .i18n_news
               .where(lang_iso639: args[:lang])
               .first
    if item.nil? and args[:use_default]
      default_locale = Erlanger::Application.config.i18n.default_locale
      return News.find(args[:id])
                 .i18n_news
                 .where(lang_iso639: default_locale)
                 .first
    end
    item
  end
end
