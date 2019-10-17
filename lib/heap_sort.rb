require 'pry'
require_relative 'min_heap'

# This method uses a heap to sort an array.
# Time Complexity:  O(n) followed by O(log n) beacause going through entire array for first operation
# Space Complexity: I am attempting to do it in O(1)
def heap_sort(list)
  if list.nil? || list.empty? || list.length == 1
    return list
  end

  min_heap = MinHeap.new

  until list.empty?
    min_heap.add(list.pop)
  end

  until min_heap.empty?
    retrieved = min_heap.remove
    list.push(retrieved)
  end

  return list
end