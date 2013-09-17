class Resource < ActiveRecord::Base
  has_and_belongs_to_many :resource_links,
                          :class_name => 'Resource',
                          :association_foreign_key => 'to_resource_id',
                          :foreign_key => 'from_resource_id',
                          :join_table => 'resource_links'

  def self.find(*args)
    if args.size == 1
      assumed_class = args[0].singularize.titleize.constantize
      puts "CLASS #{assumed_class}\n"
      assumed_class.all
    elsif args.size == 2
      Resource::find(args[0]).where(:resource_id => args[1])
    end
  rescue Exception => msg
    puts "EXCEPTION #{msg}\n"
    nil
  end

  def method_missing(method, *args, &block)
    assumed_class = method.to_s.singularize.titleize.constantize
    puts "CLASS #{assumed_class}\n"
    assumed_class.all.where(:resource_id => id)
  rescue
    super
  end

end
