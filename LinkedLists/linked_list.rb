class LinkedList
  def initialize(head = LLNode.new, tail = LLNode.new)
    @head = head
    @tail = tail
    @head.next = @tail
    @tail.prev = @head
  end

  def push(node)
    node.prev = @tail.prev
    node.next = @tail
    @tail.prev.next = node
    @tail.prev = node
  end

  def delete(node)
    node.next.prev = node.prev
    node.prev.next = node.next
    node.next = nil
    node.prev = nil
  end
end

class LLNode
  attr_accessor :next, :prev
  attr_reader :value

  def initialize(value, next_node = nil, prev = nil)
    @value = value
    @next = next_node
    @prev = prev
  end
end
