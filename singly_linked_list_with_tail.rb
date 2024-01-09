class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  attr_accessor :head, :tail, :length

  def initialize(head = nil, tail = nil, length = 0)
    @head = head
    @tail = tail
    @length = length
  end

  def append(val)
    new_node = Node.new(val)
    if @head.nil?
      @head = new_node
      @tail = new_node
    else
      old_tail = @tail
      old_tail.next_node = new_node
      @tail = new_node
    end
    @length += 1
  end

  def prepend(val)
    new_node = Node.new(val)
    if @head.nil?
      @head = new_node
      @tail = new_node
    else
      old_head = @head
      new_node.next_node = old_head
      @head = new_node
    end
    @length += 1
  end

  def add_at(index, val)
    return false if @length == 0 || index > @length
    return append(val) if index == @length
    return prepend(val) if index == 0

    ind = index - 1
    after = @head
    prev = @head
    index.times { after = after.next_node }
    ind.times { prev = prev.next_node }
    new_node = Node.new(val, after)
    prev.next_node = new_node
    @length += 1
  end

  def pop
    return false if @head.nil?

    curr = @head
    (@length - 1).times { curr = curr.next_node }
    @tail = curr
    @tail.next_node = nil
    @length -= 1
  end

  def shift
    return false if @head.nil?

    old_head = @head
    @head = old_head.next_node
    old_head.next_node = nil
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
    return 'List is empty' if @head.nil?

    curr = @head
    @length.times do
      puts curr.value
      curr = curr.next_node
    end
  end
end


ll = LinkedList.new

ll.append(10)
ll.append(20)
ll.append(30)

ll.add_at(3, 40)

ll.log