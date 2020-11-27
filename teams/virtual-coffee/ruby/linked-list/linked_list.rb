=begin
Write your code for the 'Linked List' exercise in this file. Make the tests in
`linked_list_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/linked-list` directory.
=end

# INFORMATION GATHERING
# Implement a doubly linked list
#   - A linear data structure
#   - A collection of nodes
# Our list:
#   - Holds references to the first and last nodes
#   - Array-like interface
# Our nodes:
#   - Holds a value
#   - Holds pointers to the previous and next nodes

# PSEUDOCODE

# Create a Node class
#   Initialize each node with a value and pointers to the previous and next node
#   At time of initialization we only know the value, so we'll set the pointers to nil

# Create a List class
#   Initialize each list with references to the first and last nodes (head and tail)
#   Directions specifically state array-like interface so may have to rewrite array methods found in tests

# Helpful link: https://gist.github.com/creature/8520844


class Node
  attr_accessor :value, :next, :previous

  def initialize(value)
    @value = value
    @previous = nil
    @next = nil
  end
end

class Deque
  attr_accessor :head, :tail, :length, :traversal_count

  def initialize
    @head = nil
    @tail = nil
    @length = 0
    @traversal_count = 0
  end

  def []=(i, value)
    if i > self.length || i < 0
      # Error handling for if the index is less than 0 or greater than the length of the array
      raise RuntimeError
    else
      self.get_node_at(i).value = value
    end
  end

  def [](i)
    node = self.get_node_at(i)
    node.value if node
  end

  # def [](i)
  #   node = self.get_node_at(i)
  #   node.value if node
  # end

  # def []=(i, value)
  #   if i > self.length || i < 0
  #     # Error handling for if the index is less than 0 or greater than the length of the array
  #     raise RuntimeError
  #   else
  #     self.get_node_at(i).value = value
  #   end
  # end

  def get_node_at(i)
    
    # Error handling for typing i
    unless i.is_a? Fixnum
      raise "Not a number!"
    end

    # Setting
    if i > self.length
      nil
    elsif i < @length / 2 # Asking for an older element, which is closer to the tail
      jumps = i
      node = @tail
      method = :previous
    else # It's closer to the head.
      jumps = @length - i - 1
      node = @head
      method = :next
    end

    @traversal_count += jumps
    jumps.times { node = node.__send__(method) }
    node
  end

  def show
    output = ""
    node = @head
    while node
      output += "#{node.value}"
      output += " -> " if node.next
      node = node.next
      @traversal_count += 1
    end
    output
  end

  def delete(value_to_delete)
    if @head.value == value_to_delete
      @head = @head.next
      @length -= 1
    else
      previous_node = @head
      current_node = @head.next
      while current_node
        if current_node.value == value_to_delete
          previous_node.next = current_node.next
          @length -= 1
        else
          previous_node = current_node
        end
      current_node = current_node.next
      @traversal_count += 1
      end
    end
  end

  def push(value)
    # https://github.com/ruby/ruby/blob/948051307bbee5678c07ccf0f4d276812b9d22c3/array.c#L1242

    new_node = Node.new(value)
    # Create new node
    new_node.next = @head
    # Set the next pointer of the new node to the current head
    @head ||= new_node
    # THEN, set the current head equal to the new node if the current head is not already defined
    new_node.previous = @tail
    # Set the previous pointer of the new node to the current tail
    @tail = new_node
    # THEN, set the current tail equal to the new node
    @length += 1
    # Increase the length of the object by 1
    p new_node
    p self
  end

  def pop
    # https://github.com/ruby/ruby/blob/948051307bbee5678c07ccf0f4d276812b9d22c3/array.c#L1291

  end

  def shift(value)
    # https://github.com/ruby/ruby/blob/948051307bbee5678c07ccf0f4d276812b9d22c3/array.c#L1354

  end

  def unshift
    # https://github.com/ruby/ruby/blob/948051307bbee5678c07ccf0f4d276812b9d22c3/array.c#L1480

  end
end
