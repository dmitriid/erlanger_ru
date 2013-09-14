class Event < ActiveRecord::Base
  has_many :i18n_events
  #has_many :event_tags
  #has_many :tags, :through => :event_tags
end
