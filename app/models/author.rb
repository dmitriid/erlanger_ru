class Author < ActiveRecord::Base
  #belongs_to :relation, :primary_key => :id1, :conditions => {:type1 => RESTYPE[:author]}

  #has_many :events,   through: :relations
  #has_many :articles, through: :relations
  #has_many :urls,     through: :relations
  #has_many :authors,  through: :relations
  def get_html
    return name if url.blank?
    ActionController::Base.helpers.link_to name, url
  end
end
