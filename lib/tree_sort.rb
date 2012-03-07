module TreeSort

  def self.sort_by_depth_first(root_node)
    stack = []
    result = []
    stack << root_node
    begin
      cursor = stack.last
      result << cursor
      if cursor.has_children?
        stack = stack + cursor.children.reverse
      end
      stack.delete(cursor)
    end while stack.size > 0
    result
  end

end
