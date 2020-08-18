module IconsHelper
  def icon(name, html_options = {})
    classes = "fas fa-#{name} "
    classes << html_options[:class].to_s

    if text = html_options[:text]
      classes << 'mr-1'
    end

    safe_join [
      tag.i(class: classes.strip),
      text,
    ].compact
  end
end
