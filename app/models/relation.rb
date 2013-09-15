class Relation < ActiveRecord::Base
  #belongs_to :author1, :conditions => {"relations.type1" => RESTYPE[:author]}, :class_name => 'Author', :foreign_key => :id1
  belongs_to :author2, :conditions => {"relations.type2" => RESTYPE[:author]}, :class_name => 'Author', :foreign_key => :id2
  belongs_to :url2, :conditions => {"relations.type2" => RESTYPE[:url]}, :class_name => 'Url', :foreign_key => :id2

  def author
    return nil if type2 != RESTYPE[:author]
    Author.find(id2)
  end
  def url
    return nil if type2 != RESTYPE[:url]
    Url.find(id2)
  end
end
