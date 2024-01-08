class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
    @tail = nil
  end

  def add(number)
    # create a new node
    this_node = Node.new(number)
    if @head.nil?
      @head = this_node
      return
    end

    current = @head
    # until current.nil means until we reach the last node
    current = current.next_node until current.next_node.nil?

    # point current(last node) to our new node
    current.next_node = this_node
  end

  def add_at(index, item)
    if @head.nil?
      # if list is empty the head is the new node
      this_node = Node.new(item)
      @head = this_node
    end

    if index == 0
      # if index is 0, we insert in the first position
      this_node = Node.new(item, @head)
      @head = this_node
    end

    return unless index > 0

    ind = index - 1
    before_current = @head
    current = @head

    ind.times do
      before_current = before_current.next_node
    end

    index.times do
      current = current.next_node
    end

    this_node = Node.new(item)
    after_current = before_current.next_node
    before_current.next_node = this_node
    this_node.next_node = after_current
  end

  def remove(index)
    puts 'Not enough storage' if @head.nil?

    if index == 0
      current = @head
      current.next_node = new_current
      @head = new_current
    end

    return unless index > 0

    current = get_node(index)
    before_current = get_node(index - 1)
    after_current = current.next_node
    before_current.next_node = after_current
  end

  def log
    return false if @head.nil?

    curr = @head
    until curr.nil?
      puts curr.value
      curr = curr.next_node
    end
  end

  private

  def get_node(index)
    current = @head

    index.times do
      current = current.next_node
    end

    current
  end
end