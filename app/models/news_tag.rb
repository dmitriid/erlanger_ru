class NewsTag < ActiveRecord::Base
  belongs_to :tag
  #has_and_belongs_to_many :tag
end
