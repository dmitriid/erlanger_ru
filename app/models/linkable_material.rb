# A group of functions included in every material used to retrieve linked
# materials. Use like this:
## class News
##   include LinkableMaterial
##   def linkable_material_type
##     RESTYPE[:news]
##   end
## end
module LinkableMaterial
  def get_related_authors
    Relation.where(:id1 => id, :type1 => linkable_material_type)
      .joins(:author2).load
  end
  def get_related_urls
    Relation.where(:id1 => id, :type1 => linkable_material_type)
      .joins(:url2).load
  end
  def get_related_news
    Relation.where(:id1 => id, :type1 => linkable_material_type)
      .joins(:news2).load
  end
  def get_related_events
    Relation.where(:id1 => id, :type1 => linkable_material_type)
      .joins(:event2).load
  end
  def get_related_articles
    Relation.where(:id1 => id, :type1 => linkable_material_type)
      .joins(:article2).load
  end
end