class Resource < ActiveRecord::Base
  has_and_belongs_to_many :resource_links,
                          :class_name => 'Resource',
                          :association_foreign_key => 'to_resource_id',
                          :foreign_key => 'from_resource_id',
                          :join_table => 'resource_links'

  #
  # Resource::find('type')  => Type.all for the current locale
  #                            (returns a *collection* of Type items)
  # Resource::find('type', id) => Type.first for the current locale
  #                               (returns a *single* of Type item)
  # Resource::find('type', id, 'en') => Type.first for a different locale
  #                                     (returns a *single* of Type item)
  #
  #
  def self.find(type, id = nil, lang = nil)
    lang = [I18n.locale.to_s, '*'] if lang.nil?
    lang = if lang.nil? then [I18n.locale.to_s, '*'] else [lang] end

    assumed_class = type.singularize.titleize.constantize

    resources =  assumed_class.where(lang: lang)
    return resources.where(:resource_id => id).first if not id.nil?
    resources
  rescue Exception => msg
    nil
  end

  #
  # Resource.find(1).type => Type.first for the current locale
  #                          (returns a *single* Type item)
  def method_missing(method, *args, &block)
    assumed_class = method.to_s.singularize.titleize.constantize
    assumed_class.where(:resource_id => id).where(lang: [I18n.locale.to_s, '*']).first
  rescue Exception => msg
    super
  end

end
