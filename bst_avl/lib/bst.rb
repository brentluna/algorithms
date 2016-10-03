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
    return [] unless node
    arr = [node.value]
    arr += BinarySearchTree.preorder!(node.left) if node.left 
    arr += BinarySearchTree.preorder!(node.right) if node.right
    arr
  end

  def self.inorder!(node)
    return [] unless node
    arr = []
    arr += BinarySearchTree.inorder!(node.left) if node.left
    arr << node.value 
    arr += BinarySearchTree.inorder!(node.right) if node.right
    arr
  end

  def self.postorder!(node)
    return [] unless node
    arr = []
    arr += BinarySearchTree.postorder!(node.left) if node.left
    arr += BinarySearchTree.postorder!(node.right) if node.right
    arr << node.value 
    arr
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
    return nil unless node 
    return node.right unless node.left 
    node.left = BinarySearchTree.delete_min!(node.left)    
    node
  end

  def self.delete!(node, value)
    return nil unless node 
    
    if value < node.value 
      node.left = BinarySearchTree.delete!(node.left, value)
    elsif value > node.value 
      node.right = BinarySearchTree.delete!(node.right, value)
    else 
      return node.right unless node.left 
      return node.left unless node.right
      temp = node 
      node = temp.right.min 
      node.right = BinarySearchTree.delete_min!(temp.right)
      node.left = temp.left
    end
    node 
  end
end
