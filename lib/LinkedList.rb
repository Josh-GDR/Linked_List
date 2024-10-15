require_relative './Node.rb'

class LinkedList
  attr_reader :head, :tail
  attr_accessor :size
  
  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(value)
    if self.empty?
      @tail = @head = Node.newNode(value)
      @size += 1
    elsif not self.contains?(value)
      @tail.nextNode = Node.newNode(value)
      @tail.nextNode.lastNode = @tail
      @tail = @tail.nextNode
      @size += 1
    end
  end

  def prepend(value)
    if self.empty?
      @tail = @head = Node.newNode(value)
      @size += 1
    elsif not self.contains?(value)
      @head.lastNode = Node.newNode(value)
      @head.lastNode.nextNode = @head
      @head = @head.lastNode
      @size += 1
    end
  end

  def pop
    if @head == @tail
      @tail = nil
      @head = nil
    else
      @tail = @tail.lastNode
    end

    @size -= 1
  end

  def at(index)
    return nil unless index <= @size
    auxNode = @head

    for i in (0...index)
      auxNode = auxNode.nextNode
    end
    
    return auxNode
  end

  def contains?(value, actPtr = @head)
    return false if self.empty? || actPtr.nil?
    return true if actPtr.value == value

    contains?(value, actPtr.nextNode)
  end

  def Size
    @size
  end

  def empty?
    @head == nil
  end

end
