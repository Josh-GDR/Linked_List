
class Node
  attr_accessor :value, :nextNode

  def initialize
    @value = nil
    @nextNode = nil
  end

  #Constructor with starting data
  def self.newNode(_value)
    node = Node.new
    node.value = _value
    node
  end

  def value_type
    @value.class
  end

end
