module IconsHelper
  def icon(name, html_options = {})
    classes = "fas fa-#{name} "
    classes << html_options[:class].to_s

    tag.i class: classes.strip
  end
end
