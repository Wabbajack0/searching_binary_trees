class Tree
  attr_accessor :root

  require_relative "node"

  def initialize
    @root = Node.new
  end

  # Creates the tree with the given array using recursion
  def build_tree(array, current_node = @root)
    current_node.value = array[0]
    array.shift
    if array.length > 1
      current_node.left_child = Node.new
      build_tree(array.slice!(0, array.length / 2), current_node.left_child)
      current_node.right_child = Node.new
      build_tree(array, current_node.right_child)
    elsif array.length === 1
      current_node.left_child = Node.new
      current_node.left_child.value = array[0]
      return
    else
      return
    end
  end

  # Searches the node and returns it with the given value using breadth first search technique
  def breadth_first_search(a)
    queue = [@root]
    queue.each do |node|
      if node.value === a
        return node
      else
        queue.push(node.left_child) unless node.left_child.nil?
        queue.push(node.right_child) unless node.right_child.nil?
      end
    end
    puts "Error: node not found"
  end

  # Searches the node and returns it with the given value using depth first search technique
  def depth_first_search(a)
    stack = [@root]
    stack.each do |node|
      while !node.nil?
        if node.value === a
          return node
        else
          stack.push(node.right_child) unless node.right_child.nil?
          node = node.left_child
        end
      end
    end
    puts "Error: node not found"
  end

  # Depth first search algorithm but with recursion
  def dfs_rec(a, node = @root)
      return node if node.value === a
      left = dfs_rec(a, node.left_child) unless node.left_child.nil?
      return left unless left.nil?
      right = dfs_rec(a, node.right_child) unless node.right_child.nil?
      return right unless right.nil?
  end

end
