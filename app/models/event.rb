class Event < ActiveRecord::Base
  has_many :i18n_events

  has_many :relations, :foreign_key => :id1, :conditions => {:type1 => RESTYPE[:event]}
  has_many :events,   as: :material, through: :relations
  has_many :articles, as: :material, through: :relations
  has_many :urls,     as: :material, through: :relations
  has_many :authors,  as: :material, through: :relations

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
