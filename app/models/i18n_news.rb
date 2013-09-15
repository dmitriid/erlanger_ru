class I18nNews < ActiveRecord::Base
  belongs_to :news
  validates_uniqueness_of :title

  before_create do
    self.rendered = render_body(self[:body], self[:format])
  end

  private
  def render_body(body, body_format)
    return Kramdown::Document.new(body).to_html if body_format == 'markdown'
    Sanitize.clean(body, Sanitize::Config::RELAXED)
  end
end
