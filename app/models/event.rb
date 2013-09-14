class Event < ActiveRecord::Base
  has_many :i18n_events

  def country_name
    # TODO: cache me
    @country ||= Country::by_iso3166(country_iso3166, I18n.locale.to_s)
    return @country.country_name if @country
    ''
  end

  def get_tags
    lang = I18n.locale.to_s
    EventTag.includes(:tag).where("tags.lang_iso639" => lang).to_a
  end
end
