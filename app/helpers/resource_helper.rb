module ResourceHelper
  #
  # t = Resource::find('type', id)
  # t.pages => Will return all Page items linked to this Type
  # t.page  => Will do the same
  #
  def method_missing(method, *args, &block)
    assumed_class = method.to_s.singularize.titleize.constantize
    assumed_class.where(resource_id: resource.resource_links)
                 .where(lang: [I18n.locale.to_s, '*'])
  rescue Exception => msg
    puts "EXCEPTION #{msg}"
    super
  end

  def to_param
    resource_id
  end
end
