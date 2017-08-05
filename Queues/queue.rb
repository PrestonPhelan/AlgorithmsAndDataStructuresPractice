class Queue
  def initialize(initial_values = [])
    @queue = initial_values
  end

  def add(item)
    # Add item to end of list
    @queue.push(item)
  end

  def remove
    # Remove first item
    @queue.shift
  end

  def peek
    # Return top item
    @queue.first
  end

  def isEmpty?
    # True/false if queue is empty
    @queue.empty?
  end
end
