class Page < ActiveRecord::Base

  belongs_to :resource
  include ResourceHelper

  before_create do
    self.rendered = render_body(self[:body], self[:format])
  end

  private
  def render_body(body, body_format)
    return Kramdown::Document.new(body).to_html if body_format == 'markdown'
    Sanitize.clean(body, Sanitize::Config::RELAXED)
  end
end
