class Event < ActiveRecord::Base
  @gaddress = nil

  belongs_to :resource
  include ResourceHelper
  include RenderableHelper

  before_create do
    self.rendered = render_body(self[:body], self[:format])
  end

  def googlemap_address
    if @gaddress.nil?
     @gaddress = "#{address}, #{city.first.name}, #{city.first.country.first.name}"
    end
    @gaddress
  end
end
