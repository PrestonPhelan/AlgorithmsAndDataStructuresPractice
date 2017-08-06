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

  def parent(index)
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

  def leaf?(index)
    Heap.left_child_index(index) >= size
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
    bubble_up(size - 1)
  end

  def extract_min
    # Switch root with last element
    @heap[0], @heap[-1] = @heap[-1], @heap[0]

    # Store and delete former root (the minimum)
    minimum = trim

    # Move last element down until its in the right place
    bubble_down(0)

    minimum
  end

  def bubble_down(index)
    return if leaf?(index) || children(index).all >= @heap[index]

    if left_child(index) <= right_child(index)
      destination_idx = Heap.left_child_index(index)
    else
      destination_idx = Heap.right_child_index(index)
    end

    @heap[index], @heap[destination_idx] = @heap[destination_idx], @heap[index]
    bubble_down(destination_idx)
  end

  def bubble_up(index)
    # If node is greater than its parent, its in the right place
    return if index == 0 || parent(index) <= @heap[index]

    # Else swap values, and try the next level
    parent_index = Heap.parent_index(index)
    @heap[index], @heap[parent_index] = @heap[parent_index], @heap[index]
    bubble_up(parent_index)
  end

  def trim
    @heap.pop
  end
end
