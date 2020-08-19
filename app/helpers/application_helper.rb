module ApplicationHelper
  def ascii_bullet(options = {})
    content_tag(:span, "&#8226;".html_safe, options)
  end
end
