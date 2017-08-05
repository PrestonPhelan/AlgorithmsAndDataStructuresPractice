require('tree')

class BinTree < Tree
  def traverseInOrder
    @root.traverseInOrder
  end

  def traversePreOrder
    @root.traversePreOrder
  end
end

class BinTreeNode < TreeNode
  attr_accessor :left_child, :right_child

  def initialize(value, parent = nil, children = [])
    super(value, parent, children)
    @left_child = children.first
    @right_child = children.last
  end

  def traverseInOrder
    @left_child.traverseInOrder if @left_child
    self.visit
    @right_child.traverseInOrder if @right_child
  end

  def traversePreOrder
    self.visit
    @left_child.traversePreOrder if @left_child
    @right_child.traversePreOrder if @right_child
  end

  def visit
    # Placeholder for visiting a node
    puts @value
  end
end
