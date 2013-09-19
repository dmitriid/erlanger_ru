module RenderableHelper
  def render_body(text, format)
    text = Kramdown::Document.new(text).to_html
    Sanitize.clean(text, Sanitize::Config::RELAXED)
  end
end
