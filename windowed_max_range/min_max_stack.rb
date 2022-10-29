class MinMaxStack
  attr_reader :max, :min

  def initialize(store = [])
    @store = store
    @max = -1/0.0
    @min = 1/0.0
  end

  def to_a
    @store.dup
  end

  def push(el)
    @max = [el,max].max
    @min = [el,min].min
    @store << el
  end

  def pop
    if @store[0..-2].empty?
      @max, @min = -1/0.0, 10.0
    elsif @store.last == @max
      @max = @store[0..-2].max
    elsif @store.last == @min
      # debugger
      @min = @store[0..-2].min
    end

    @store.pop
  end

  def empty?
    @store.empty?
  end

end


###################### Test Code ######################
# a = MinMaxStack.new
# a.push(8)
# a.push(3)
# a.push(12)
# a.push(0)
# a.push(22)
# a.push(-5)
# a.push(-8)

# p a
# a.pop
# p a
# a.pop
# p a
# a.pop
###################### End Test ######################
