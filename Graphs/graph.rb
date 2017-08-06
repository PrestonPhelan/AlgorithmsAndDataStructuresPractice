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
