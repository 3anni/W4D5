require_relative 'min_max_stack_queue'

require 'byebug'

def windowed_max_range(arr, window_size)
  # start the queue with the first window_size elements
  queue = MinMaxStackQueue.new
  max_range = -1/0.0

  # debugger
  # establish the max


  arr.each_with_index do |el, i|
    queue.enqueue(el)
    queue.dequeue if queue.size > window_size

    if queue.size == window_size
      current_range = queue.max - queue.min
      max_range = current_range if !max_range || current_range > max_range
    end
  end

  max_range
end



p windowed_max_range([1, 0, 2, 5, 4, 8], 2) #== 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) #== 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) #== 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) #== 6 # 3, 2, 5, 4, 8
