class Graph
  def bfs(start_node, target)
    visited = Set.new
    node_queue = [start_node]

    until node_queue.empty?
      current_node = node_queue.shift
      return current_node if current_node.value == target

      visted << current_node
      current_node.adjacents.each do |adj_node|
        node_queue << adj_node unless visited.include?(adj_node)
      end
    end

    nil
  end

  def dfs(start_node, target)
    visited = Set.new
    node_stack = [start_node]

    until node_stack.empty?
      current_node = node_stack.pop
      return current_node if current_node.value == target

      visited << current_node
      current_node.adjacents.each do |adj_node|
        node_stack << adj_node unless visited.include?(adj_node)
      end
    end

    nil
  end

  def bidirectional_search(node1, node2)
    # Track number of steps taken in each search
    steps1 = 0
    steps2 = 0

    visited1 = Set.new
    visited2 = Set.new

    node_queue1 = [node1]
    node_queue2 = [node2]

    until node_queue1.empty? && node_queue2.empty?
      current_node = node_queue1.shift
      return steps1 + steps2 if visited2.include?(current_node)

      visited1 << current_node
      current_node.adjacents.each do |adj_node|
        node_queue1 << adj_node unless visited1.include?(adj_node)
      end

      steps1 += 1

      current_node = node_queue2.shift
      return steps1 + steps2 if visited1.include?(current_node)

      visited2 << current_node
      current_node.adjacents.each do |adj_node|
        node_queue2 << adj_node unless visited2.include?(adj_node)
      end

      steps2 += 1
    end

    nil
  end
end

class GraphNode
  attr_reader :value

  def initialize(value, adjacents = [])
    @value = value
    @adjacents = adjacents
  end

  def visit
    # Placeholder code for visit
    puts @value
  end
end
