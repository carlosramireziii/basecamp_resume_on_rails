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

  def icon_for_content_type(content_type)
    case content_type
    when /audio/
      'file-audio'
    when /image/
      'file-image'
    when /pdf/
      'file-pdf'
    when /text/
      'file-alt'
    when /video/
      'file-video'
    else
      'file'
    end
  end
end
