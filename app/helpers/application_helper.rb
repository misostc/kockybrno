module ApplicationHelper
  def allowed_tags(content)
    sanitize content, tags: %w(strong em a br b i), attributes: %w(href)
  end
end
