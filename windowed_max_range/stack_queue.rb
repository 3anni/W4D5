require_relative 'my_stack'

class StackQueue
  def initialize
    @in_stack = MyStack.new
    @out_stack = MyStack.new
  end

  def enqueue(el)
    @store_in.push(el)
  end

  def dequeue
    queuify if @out_stack.empty?
    @out_stack.pop
  end

  def empty?
    @out >= @store_in.length
  end

  def size
    @in_stack.size + @out_stack.size
  end

  private
  def queuify
    @out_stack.push(@in_stack.pop) until @in_stack.empty?
  end
end
