class Tree
  attr_reader :root

  def initialize(root_node)
    @root = root_node
    @root.parent = nil
  end
end

class TreeNode
  attr_accessor :parent, :children
  attr_reader :value

  def initialize(value, parent = nil, children = [])
    @value = value
    @parent = parent
    @children = children
  end
end
