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

  def contains?(value)
    return false if find(value).nil?
    
    true
  end

  def find(value, actPtr = @head)
    return nil if self.empty? || actPtr.nil?
    return actPtr if actPtr.value == value
  
    find(value, actPtr.nextNode)  
  end

  def to_s(actPtr = @head)
    return '|' if actPtr.nil?

    return "#{actPtr.value} - #{to_s(actPtr.nextNode)}"
  end

  def insert_at(value, pos)
    return false unless index <= @size
    return false unless self.empty?
    
    if pos == 0
      prepend(value)
      return true
    end
    
    if pos == @size - 1
      eppend(value)
      return true
    end

    return false if self.contains?(value)

    auxNode = @head

    for i in (0...pos)
      auxNode = auxNode.nextNode
    end
    
    newNode = Node.newNode(value)
    newNode.nextNode auxNode.nextNode
    newNode.lastNode = auxNode
    auxNode.nextNode = newNode

    true
  end

  def remove_at(value, pos)
    return false unless index <= @size
    return false unless self.empty?
    
    if pos == @size - 1
      pop(value)
      return true
    end

    return false if self.contains?(value)

    auxNode = @head

    for i in (0...pos)
      auxNode = auxNode.nextNode
    end

    auxNode = auxNode.lastNode
    auxNode.nextNode = auxNode.nextNode.nextNode
    true
  end

  def Size
    @size
  end

  def empty?
    @head == nil
  end

end
