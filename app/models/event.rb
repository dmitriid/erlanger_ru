class Event < ActiveRecord::Base
  has_many :i18n_events
  has_many :event_tags
  has_many :tags, :through => :event_tags

  def country_name
    # TODO: cache me
    @country ||= Country::by_iso3166(country_iso3166, I18n.locale.to_s)
    return @country.country_name if @country
    ''
  end
end
