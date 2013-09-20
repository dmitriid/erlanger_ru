class Country < ActiveRecord::Base
  belongs_to :resource
  include ResourceHelper
end
