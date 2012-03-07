module ApplicationHelper
  #render data store by tree sructrure.
  #ancestry gem is reuqired
  #def render_tree(root_node, partial = nil)
    #stack = []
    #stack << root_node
    #html = ""
    #begin
      #cursor = stack.last
      #html << (render :partial => cursor, :locals => {:depth => cursor.depth })
      #if cursor.has_children?
        #stack = stack + cursor.children.reverse
      #end
      #stack.delete(cursor)
    #end while stack.size > 0
    #html.html_safe
  #end 
  def render_tree(root_node, options = {})
    sorted_node = root_node.tree_sorted_mentions
    html = ""
    sorted_node.each do |node|
      html += (render :partial => node, :locals => options)
    end
    return html.html_safe
  end


  
end
