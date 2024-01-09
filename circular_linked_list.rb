class Node
  attr_accessor :value, :next_node
  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class CircularLinkedList
  attr_accessor :head, :tail, :length
  def initialize
    @head = nil
    @tail = nil
    @length = 0
  end

  def append(value)
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
      @tail = new_node
    else
      @tail.next_node = new_node
      @tail = new_node
      new_node.next_node = @head
    end
    @length += 1
  end

  def unshift(value)
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
      @tail = new_node
    else
      @tail.next_node = new_node
      old_head = @head
      @head = new_node
      new_node.next_node = old_head
    end
    @length +=1
  end

  def add_at(index, value)
    return false if index > @length
    return unshift(value) if index == 0
    return append(value) if index == @length

    
    ind = index - 1
    after = @head
    prev = @head
    index.times {after = after.next_node}
    ind.times {prev = prev.next_node}
    new_node = Node.new(value, after)
    prev.next_node = new_node
    
    @length += 1
  end

  def pop
    return false if @head.nil?

    curr = @head
    (@length - 2).times { curr = curr.next_node }
    old_tail = @tail
    old_tail.next_node = nil
    @tail = curr
    @tail.next_node = @head
    @length -= 1
  end

  def shift
    return false if @head.nil?

    old_head = @head
    @head = old_head.next_node
    old_head.next_node = nil
    @tail.next_node = @head

    @length -= 1
  end

  def remove_at(index)
    return false if @head.nil?
    return pop if index == @length - 1
    return shift if index == 0

    curr = @head
    prev = @head
    ind = index - 1

    index.times { curr = curr.next_node }
    ind.times { prev = prev.next_node }
    after_current = curr.next_node
    prev.next_node = after_current

    @length -= 1
  end

  def log
    return false if @head.nil?

    curr = @head
    @length.times do
      puts curr.value
      curr = curr.next_node
    end
  end
end