module NewsHelper
  def render_new(new_object)
    html = ""
    if new_object.informable_type == "Mention"
      html += "#{}"
    end

    if new_object.informable_type == "Friendship"
    end
    return html
  end
end
