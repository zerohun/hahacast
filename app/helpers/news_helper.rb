module NewsHelper
  def render_each_news(new_object)
    html = ""
    if new_object.informable_type == "Mention"
      user_name = new_object.informable.user.first_name + new_object.user.last_name 
      html += "#{user.name} spoke on #{user.informable.user.name}'s cast"
    end

    if new_object.informable_type == "Friendship"
      html += "#{}"
    end
    return html
  end
end
