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

  def add_child(node)
    raise "Tried to add more than two children" if @left_child && @right_child
    @left_child ? add_right_child(node) : add_left_child(node)
  end

  def add_left_child(node)
    raise "Tried to add duplicate child" if @left_child
    @left_child = node
    node.parent = self
  end

  def add_right_child(node)
    raise "Tried to add duplicate child" if @right_child
    @right_child = node
    node.parent = self
  end

  def add_to_bottom(node)
    # Adds node to left-most available position on lowest level
    if @left_child && @right_child
      if @right_child.min_depth < @left_child.min_depth
        @right_child.add_to_bottom(node)
      else
        @left_child.add_to_bottom(node)
      end
    else
      add_child(node)
    end
  end

  def depth
    return 1 unless @left_child || @right_child
    return @left_child.depth + 1 unless @right_child
    return @right_child.depth + 1 unless @left_child
    [@left_child.depth, @right_child.depth].max + 1
  end

  def min_depth
    return 1 unless @left_child && @right_child
    [@left_child.depth, @right_child.depth].min + 1
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
