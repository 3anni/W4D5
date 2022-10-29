require_relative 'min_max_stack'

class MinMaxStackQueue
  def initialize
    @in_stack = MinMaxStack.new
    @out_stack = MinMaxStack.new
  end

  def enqueue(el)
    @in_stack.push(el)
  end

  def dequeue
    queuify if @out_stack.empty?
    @out_stack.pop
  end

  def empty?
    @out_stack.empty? && @in_stack.empty?
  end

  def size
    @in_stack.size + @out_stack.size
  end

  def min
    [@in_stack.min, @out_stack.min].min
  end

  def max
    [@in_stack.max, @out_stack.max].max
  end

  def inspect
    "in_stack(name: #{@in_stack.to_a},
      out_stack: #{@out_stack.to_a},
      object_id: #{"0x00%x" % (object_id << 1)}),
      min: #{min},
      max: #{max}"
  end

  private
  def queuify
    @out_stack.push(@in_stack.pop) until @in_stack.empty?
  end
end




###################### Test Code ######################
msq = MinMaxStackQueue.new
msq.enqueue(8)
p msq
msq.enqueue(3)
p msq
msq.enqueue(12)
p msq
msq.dequeue
p msq
msq.enqueue(0)
p msq
msq.dequeue
p msq
msq.enqueue(22)
p msq
msq.dequeue
p msq
msq.enqueue(-5)
p msq
msq.dequeue
p msq
msq.enqueue(-8)
#
p msq
msq.dequeue
p msq
msq.dequeue
###################### End Test ######################

