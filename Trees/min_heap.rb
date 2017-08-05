require 'binary_tree'

class MinHeap
  def depth
    @root.depth
  end

  def insert(value)
    new_node = BinTreeNode.new(value)
    @root.add_to_bottom(new_node)
    until new_node.parent.value <= new_node.value
      swap(new_node, new_node.parent)
    end
  end

  def swap(child_node, parent_node)
    temp = parent_node.value
    parent_node.value = child_node.value
    child_node.value = temp
  end
end
