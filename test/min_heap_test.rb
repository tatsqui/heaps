require_relative "test_helper"

describe "Heap" do
  let(:heap) {MinHeap.new}
  it "can be created" do
    
    # Assert
    expect(heap).must_be_instance_of MinHeap
  end

  it "can have nodes added" do
    # Arrange
    key = 5
    value = "Pasta"

    # Assert
    expect(heap).must_respond_to :add

    # Act
    heap.add(key, value)
  end

  it "adds nodes in a proper order" do
    # Arrange
    heap.add(3, "Pasta")
    heap.add(6, "Soup")
    heap.add(1, "Pizza")

    # Act
    output = heap.to_s

    # Assert

    expect(output).must_equal "[Pizza, Soup, Pasta]"
  end

  it "adds nodes in a proper order with a lot of nodes" do
    # Arrange
    heap.add(3, "Pasta")
    heap.add(6, "Soup")
    heap.add(1, "Pizza")
    heap.add(0, "Donuts")
    heap.add(16, "Cookies")
    heap.add(57, "Cake")

    # Act
    output = heap.to_s

    # Assert

    expect(output).must_equal "[Donuts, Pizza, Pasta, Soup, Cookies, Cake]"
  end

  it "can remove nodes in the proper order" do
   # Arrange
   heap.add(3, "Pasta")
   heap.add(6, "Soup")
   heap.add(1, "Pizza")
   heap.add(0, "Donuts")
   heap.add(16, "Cookies")
   heap.add(57, "Cake")

   # Act
   removed = heap.remove

   # Assert
   expect(removed).must_equal "Donuts"

   # Another Act
   removed = heap.remove

   # Another assert
   expect(removed).must_equal "Pizza"

  # Another Act
  removed = heap.remove

  # Another assert
  expect(removed).must_equal "Pasta"
  end

  it "can sort a list in ascending order using heap sort" do
    list = [5, 3, 1, 7]
    min_result = [1, 3, 5, 7]

    sorted_result = heap_sort(list)
    
    expect(sorted_result).must_equal(min_result)
  end
end