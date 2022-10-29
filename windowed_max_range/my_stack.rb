class MyStack
  # attr_reader :max, :min

  def initialize(store = [])
    # @max = -1/0.0
    # @min = 1/0.0
    @store = Array.new
  end

  def push(el)
    # @max = [el,max].max
    # @max = [el,min].min
    @store << el
  end

  def pop
    # max = @store[0..-2].max if @store.last == max
    # min = @store[0..-2].max if @store.last == min
    @store.pop
  end

  def peek
    @store.last
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end

end
