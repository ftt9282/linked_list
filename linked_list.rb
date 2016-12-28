class LinkedList
  def initialize
  	@head = nil
  	@tail = nil
  end

  def head
    @head
  end

  def tail
    @tail
  end

  def size
  	return 0 unless @head
    count = 1
    current_node = @head
    loop do
      if current_node.next_node
        count +=1
        current_node = current_node.next_node
      else
        return count
      end
    end
  end

  def append(data)
  	node = Node.new(data)
    if !@head
      @head = node
      @tail = node
    else
      @tail.next_node = node
      @tail = node
    end
  end

  def prepend(data)
    node = Node.new(data)
    if !@head
      @head = node
      @tail = node
    else
      old_node = @head
      @head = node
      @head.next_node = old_node
    end
  end

  def pop
    return "Error" unless @head
    current_node = @head
    if self.size == 1
      popped_node = @tail.value
      @head = nil
      @tail = nil
      popped_node
    else
      until current_node.next_node == @tail
        current_node = current_node.next_node
      end
      current_node.next_node = nil
      popped_node = @tail.value
      @tail = current_node
      popped_node
    end
  end

  def at(index)
  	return "Error" unless @head
    node_count = self.size - 1
    if index < 0 || index > node_count
      return "Index #{index} is not within the boundry of this list"
    else
      current_node = @head
      index.times do
        current_node = current_node.next_node
      end
      current_node.value
    end
  end

  def contains?(data)
    value = self.find(data)
    if value.is_a? Integer
      true
    else
      false
    end	
  end

  def find(data)
  	return "Error" unless @head
    current_node = @head
    count = 0
    while current_node
      if current_node.value == data
        return count
      end
      current_node = current_node.next_node
      count += 1
    end
    return "Could not find #{data} in list"
  end

  def to_s
    return 'nil' unless @head
    list_size = self.size
    current_node = @head
    list_size.times do
      print "( #{current_node.value} ) --> "
      current_node = current_node.next_node
    end
    print "nil"
  end
end

class Node
  attr_accessor :value, :next_node
  def initialize(value=nil, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

a = LinkedList.new
a.append(4)
a.append(5)
a.append(6)
puts a.to_s
puts "Sending a pop..."
a.pop
puts a.to_s
puts "Prepending 100..."
a.prepend(100)
puts a.to_s