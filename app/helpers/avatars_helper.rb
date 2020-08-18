module AvatarsHelper
  def image_or_text_avatar(user, image_size: DEFAULT_IMAGE_SIZE_IN_PX, text_size: DEFAULT_TEXT_SIZE_IN_REM)
    if user.avatar.attached?
      image_avatar(user, size: image_size)
    else
      text_avatar(user, size: text_size)
    end
  end

  def image_avatar(user, size: DEFAULT_IMAGE_SIZE_IN_PX)
    image_tag user.avatar.variant(resize_to_fill: [size, size]), class: "rounded-circle border", alt: "User Avatar"
  end

  def text_avatar(user, size: DEFAULT_TEXT_SIZE_IN_REM)
    font_size = size / TEXT_CONTAINER_MULTIPLIER 
    if user.first_name.present? && user.last_name.present?
      initials = (user.first_name.first + user.last_name.first).upcase
    else
      initials = user.email.first(2).upcase
    end

    outer_opts = {
      class: "bg-light border rounded-circle d-inline-flex justify-content-center align-items-center", 
      style: "width:#{size}rem;height:#{size}rem;"
    }
    inner_opts = { class: "h-5 m-0 p-0 text-muted no-line-height", style: "font-size:#{font_size}rem" }

    content_tag(:div, content_tag(:span, initials, inner_opts), outer_opts)
  end

  private

  DEFAULT_IMAGE_SIZE_IN_PX = 48
  DEFAULT_TEXT_SIZE_IN_REM = 3
  TEXT_CONTAINER_MULTIPLIER = 3
end