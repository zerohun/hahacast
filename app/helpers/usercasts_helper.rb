module UsercastsHelper

  def render_mentions(root_node, options = {})
    sorted_node = root_node.tree_sorted_mentions
    html = ""
    sorted_node.each do |node|
      html += (render :partial => node, :locals => options)
    end
    return html.html_safe
  end
end
