class Stack
  def initialize(initial_values = [])
    @stack = initial_values
  end

  def pop
    # Removes and returns top item
    @stack.pop
  end

  def push(item)
    # Puts item on top of stack
    @stack << item
  end

  def peek
    # Returns top of stack
    @stack.last
  end

  def isEmpty?
    # True/false, is stack empty
    @stack.empty?
  end
end
