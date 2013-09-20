class Article < ActiveRecord::Base
  belongs_to :resource
  include ResourceHelper
  include RenderableHelper

  before_create do
    self.rendered = render_body(self[:body], self[:format])
  end

end
