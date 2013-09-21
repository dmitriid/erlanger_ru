module RenderableHelper
  def render_body(text, format)
    text = Kramdown::Document.new(text).to_html
    sanitize_html(text)
  end
  def sanitize_html(text)
    iframe = lambda do |env|
      sanitize_nodes(env)
    end
    config = Sanitize::Config::RELAXED.merge(:transformers => [iframe])
    Sanitize.clean(text, config)
  end

  def sanitize_nodes(env)
    node = env[:node]
    node_name = env[:node_name]

    # Don't continue if this node is already whitelisted or is not an element.
    return if env[:is_whitelisted] || !node.element?

    # Don't continue unless the node is an iframe.
    return unless node_name == 'iframe'

    # Verify that the video URL is actually a valid YouTube, Vimeo,
    # Slideshare, Scribd URL.
    uri = URI(node['src'])
    return if (uri.host =~ /(www\.)?(scribd|slideshare|vimeo|youtube)\.(com|net)/).nil?

    # We're now certain that this is a YouTube embed, but we still need to run
    # it through a special Sanitize step to ensure that no unwanted elements or
    # attributes that don't belong in a YouTube embed can sneak in.
    Sanitize.clean_node!(node, {
        :elements => %w[iframe],

        :attributes => {
            'iframe' => %w[allowfullscreen frameborder height src width]
        }
    })

    # Now that we're sure that this is a valid YouTube embed and that there are
    # no unwanted elements or attributes hidden inside it, we can tell Sanitize
    # to whitelist the current node.
    {:node_whitelist => [node]}
  end
end
