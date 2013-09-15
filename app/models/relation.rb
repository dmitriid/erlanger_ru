class Relation < ActiveRecord::Base
  belongs_to :author2, :conditions => {"relations.type2" => RESTYPE[:author]}, :class_name => 'Author', :foreign_key => :id2
  belongs_to :url2, :conditions => {"relations.type2" => RESTYPE[:url]}, :class_name => 'Url', :foreign_key => :id2
  belongs_to :news2, :conditions => {"relations.type2" => RESTYPE[:news]}, :class_name => 'News', :foreign_key => :id2
  belongs_to :event2, :conditions => {"relations.type2" => RESTYPE[:event]}, :class_name => 'Event', :foreign_key => :id2
  belongs_to :article2, :conditions => {"relations.type2" => RESTYPE[:article]}, :class_name => 'Article', :foreign_key => :id2

  def author
    return nil if type2 != RESTYPE[:author]
    Author.find(id2)
  end
  def url
    return nil if type2 != RESTYPE[:url]
    Url.find(id2)
  end
  def news
    return nil if type2 != RESTYPE[:news]
    News.find(id2)
  end
  def event
    return nil if type2 != RESTYPE[:event]
    Event.find(id2)
  end
  def article
    return nil if type2 != RESTYPE[:article]
    Article.find(id2)
  end
end
