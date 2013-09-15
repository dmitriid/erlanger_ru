class Url < ActiveRecord::Base
  has_many :relations, :foreign_key => :id1, :conditions => {:type1 => RESTYPE[:url]}
  has_many :news,     as: :material, through: :relations
  has_many :events,   as: :material, through: :relations
  has_many :articles, as: :material, through: :relations
  has_many :urls,     as: :material, through: :relations
  has_many :authors,  as: :material, through: :relations
end