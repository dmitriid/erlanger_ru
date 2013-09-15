class Relation < ActiveRecord::Base
  belongs_to :news,     :conditions => {:type1 => RESTYPE[:news]}
  belongs_to :event,    :conditions => {:type1 => RESTYPE[:event]}
  belongs_to :article,  :conditions => {:type1 => RESTYPE[:article]}
  belongs_to :url,      :conditions => {:type1 => RESTYPE[:url]}
  belongs_to :author,   :conditions => {:type1 => RESTYPE[:author]}

  has_many :news, as: :material,     :conditions => {:type2 => RESTYPE[:news]}
  has_many :events, as: :material,   :conditions => {:type2 => RESTYPE[:event]}
  has_many :articles, as: :material, :conditions => {:type2 => RESTYPE[:article]}
  has_many :urls, as: :material,     :conditions => {:type2 => RESTYPE[:url]}
  has_many :authors, as: :material,  :conditions => {:type2 => RESTYPE[:author]}
end
