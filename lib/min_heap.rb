class HeapNode
  attr_reader :key, :value

  def initialize(key, value)
    @key = key
    @value = value
  end
end

class MinHeap

  def initialize
    @store = []
  end

  # This method adds a HeapNode instance to the heap
  # Time Complexity: ?
  # Space Complexity: ?
  def add(key, value = key)
    @store << HeapNode.new(key, value)
    heap_up(@store.length-1)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: ?
  # Space Complexity: ?
  def remove()
    index = 0
    last = @store.length - 1
    
    swap(index, last)
    return_value = @store.pop
    heap_down(index)

    return return_value.value
  end


  # Used for Testing
  def to_s
    return "[]" if @store.empty?

    output = "["
    (@store.length - 1).times do |index|
      output += @store[index].value + ", "
    end

    output += @store.last.value + "]"
      
    return output
  end

  # This method returns true if the heap is empty
  # Time complexity: O(1) - Uncertain if Ruby under the hood implements an array in the strictest sense, then by inference it allocates a certain number of spaces to an array and retrieving the length would be constant. Otherwise it is O(n) due to check each element until it becomes nil.
  # Space complexity: O(1)
  def empty?
    return @store.empty?
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: ?
  # Space complexity: ?
  def heap_up(index)
    while index > 0
      parent_index = ((index - 1) / 2)
      if @store[parent_index].key > @store[index].key
        swap(parent_index, index)
        index = parent_index
      else
        return
      end
    end
  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    child_index_left = ((index * 2) + 1)
    child_index_right = ((index * 2) + 2)

    if @store[child_index_left] == nil
      return
    elsif @store[child_index_left].key < @store[index].key
        swap(child_index_left, index)
        heap_down(child_index_left)
    else
        swap(child_index_right, index)
        heap_down(child_index_right)
    end
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end