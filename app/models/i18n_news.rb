class I18nNews < ActiveRecord::Base
  belongs_to :news
  validates_uniqueness_of :title
end
