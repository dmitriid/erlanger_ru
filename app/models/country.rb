class Country < ActiveRecord::Base

  # static
  def self.by_iso3166(code, lang)
    # TODO: cache me
    Country.where(:country_iso3166 => code, :lang_iso639 => lang).take
  end
end
