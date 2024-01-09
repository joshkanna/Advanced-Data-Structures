class Node
  attr_accessor :value, :left, :right

  def initialize(value = nil, left = nil, right = nil)
    self.value = value
    self.left = left
    self.right = right
  end
end

class BinaryTree
  attr_accessor :root, :size

  def initialize(node)
    self.root = node
    @size = 0
  end

  def pushNode(node = root, value)
    if value > node.value
      if node.right
        pushNode(node.right, value)
      else
        node.right = Node.new(value)
        @size += 1
      end
    elsif node.left
      pushNode(node.left, value)
    else
      node.left = Node.new(value)
      @size += 1
    end
  end

  def print_in_order(node = root)
    return if node.nil?

    print '('
    print_in_order(node.left)
    print ", #{node.value}, "
    print_in_order(node.right)
    print ')'
  end

  def remove(value, node = root)
    removeHelper(value, node = root)
    @size -= 1
    node
  end

  def find_max(node = root)
    if node.nil?
      return nil
    elsif node.right.nil?
      return node
    end

    find_max(node.right)
  end

  def find_min(node = root)
    if node.nil?
      return nil
    elsif node.left.nil?
      return node
    end

    find_min(node.left)
  end

  private

  def removeHelper(value, node = root)
    return nil if node.nil?

    if node.value > value
      node.left = removeHelper(value, node.left)
    elsif node.value < value
      node.right = removeHelper(value, node.right)
    elsif !node.left.nil? && !node.right.nil?
      temp = node
      min_of_right_subtree = find_min(node.right)
      node.value = min_of_right_subtree.value
      node.right = removeHelper(min_of_right_subtree.value, node.right)
    elsif !node.left.nil?
      node = node.left
    elsif !node.right.nil?
      node = node.right
    else
      node = nil
    end
    node
  end

  def find(value)
    return true if root.value == value

    find_helper(root, value)
  end

  def find_helper(node, value)
    return false if node.nil?

    return true if node.value == value

    found = false
    found = find_helper(node.left, value)
    return found if found == true

    find_helper(node.right, value)
  end
end
