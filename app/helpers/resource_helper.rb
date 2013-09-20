module ResourceHelper
  #
  # t = Resource::find('type', id)
  # t.pages => Will return all Page items this Type links to
  # t.page  => Will do the same
  #
  # t.page(:in) => Will find all Page items that link to this Type
  #
  def method_missing(method, *args, &block)
    assumed_type  = method.to_s.singularize
    assumed_class = assumed_type.titleize.constantize
    if args.empty? or args[0] == :out
      assumed_class.where(resource_id: resource.resource_links)
                   .where(lang: [lang, '*'])
    elsif args[0] == :in
      resources = Resource.joins(:resource_links).where('resource_links.to_resource_id' => resource_id)
      assumed_class.where(resource_id: resources).where(lang: [lang, '*'])
    end
  rescue Exception => msg
    super
  end

  def to_param
    resource_id
  end
end
