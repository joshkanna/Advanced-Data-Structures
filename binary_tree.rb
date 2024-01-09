class BinaryTree
  attr_accessor :root

  def initialize(node)
    self.root = node
  end

  def find(value)
    return true if root.value == value
    return find_helper(root, value)
  end

  def find_helper(node, value)
    return false if node.nil?

    return true if node.value == value

    found = false
    found = find_helper(node.left, value)
    return found if found == true
    return find_helper(node.right, value)
  end
end

class Node
  attr_accessor :value, :left, :right

  def initialize(value = nil, left = nil, right = nil)
    self.value = value
    self.left = left
    self.right = right
  end
end