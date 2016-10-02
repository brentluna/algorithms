class BSTNode
  attr_accessor :left, :right
  attr_reader :value

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

class BinarySearchTree
  def initialize

  end

  def insert(value)

  end

  def find(value)

  end

  def inorder

  end

  def postorder

  end

  def preorder

  end

  def height

  end

  def min

  end

  def max

  end

  def delete(value)

  end

  def self.insert!(node, value)
    return BSTNode.new(value) if node.nil?
    
    if node.value >= value 
      node.left = BinarySearchTree.insert!(node.left, value)
    else 
      node.right = BinarySearchTree.insert!(node.right, value)
    end

    node
  end

  def self.find!(node, value)
    return nil unless node
    return node if node.value == value
    if node.value <= value 
      return BinarySearchTree.find!(node.right, value)
    else 
      return BinarySearchTree.find!(node.left, value)
    end
  end

  def self.preorder!(node)

  end

  def self.inorder!(node)

  end

  def self.postorder!(node)

  end

  def self.height!(node)
    return -1 unless node 
    left = BinarySearchTree.height!(node.left) + 1
    right = BinarySearchTree.height!(node.right) + 1
    left > right ? left : right
  end

  def self.max(node)
    return node unless node.right
    BinarySearchTree.max(node.right)
  end

  def self.min(node)
    return node unless node.left
    BinarySearchTree.min(node.left)
  end

  def self.delete_min!(node)

  end

  def self.delete!(node, value)

  end
end
