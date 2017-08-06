require('tree')

class BinTree < Tree
  def traverse_in_order
    @root.traverse_in_order
  end

  def traverse_pre_order
    @root.traverse_pre_order
  end

  def traverse_post_order
    @root.traverse_post_order
  end
end

class BinTreeNode < TreeNode
  attr_accessor :left_child, :right_child

  def initialize(value, parent = nil, children = [])
    super(value, parent, children)
    @left_child = children.first
    @right_child = children.last
  end

  def traverse_in_order
    @left_child.traverse_in_order if @left_child
    self.visit
    @right_child.traverse_in_order if @right_child
  end

  def traverse_pre_order
    self.visit
    @left_child.traverse_pre_order if @left_child
    @right_child.traverse_pre_order if @right_child
  end

  def traverse_post_order
    @left_child.traverse_post_order if @left_child
    @right_child.traverse_post_order if @right_child
    self.visit
  end

  def visit
    # Placeholder for visiting a node
    puts @value
  end
end
