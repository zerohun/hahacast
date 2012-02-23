module MentionsHelper

  #render data store by tree sructrure.
  #ancestry gem is reuqired
  def render_tree(root_model, partial = nil)
    stack = []
    stack << root_model
    html = ""
    begin
      cursor = stack.last
      html << (render :partial => cursor, :locals => {:depth => cursor.depth })
      if cursor.has_children?
        stack = stack + cursor.children.reverse
      end
      stack.delete(cursor)

    end while stack.size > 0

    html.html_safe


  end
end
