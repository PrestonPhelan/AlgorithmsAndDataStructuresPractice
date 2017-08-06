class Heap
  def initialize
    @heap = []
  end

  def self.parent_index(index)
    (index - 1) / 2
  end

  def self.left_child_index(index)
    2 * index + 1
  end

  def self.right_child_index(index)
    2 * index + 2
  end

  def parent
    @heap[Heap.parent_index(index)]
  end
  
  def children(index)
    [Heap.left_child_index(index), Heap.right_child_index(index)]
  end

  def left_child(index)
    @heap[Heap.left_child_index(index)]
  end

  def right_child(index)
    @heap[Heap.right_child_index(index)]
  end

  def size
    @heap.size
  end
end

class MinHeap < Heap
  def insert(value)
    # Place value at end of heap
    @heap << value

    # Move it up the heap until it is larger than its parent
    bubble_up
  end
end
