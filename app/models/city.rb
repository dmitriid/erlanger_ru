class City < ActiveRecord::Base
  belongs_to :resource
  include ResourceHelper
end
