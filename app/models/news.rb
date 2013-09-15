class News < ActiveRecord::Base
  has_many :i18n_news

  #has_many :relations, :foreign_key => :id1, :conditions => {:type1 => RESTYPE[:news]}
  #has_many :events,   as: :material, through: :relations
  #has_many :articles, as: :material, through: :relations
  #has_many :urls,     as: :material, through: :relations
  #has_many :authors,  as: :material, through: :relations

  def get_tags
    lang = I18n.locale.to_s
    NewsTag.includes(:tag).where("tags.lang_iso639" => lang).to_a
  end

  def get_related_authors
    Relation.where(:id1 => id, :type1 => RESTYPE[:news]).joins(:author2).load
  end
  def get_related_urls
    Relation.where(:id1 => id, :type1 => RESTYPE[:news]).joins(:url2).load
  end
end
