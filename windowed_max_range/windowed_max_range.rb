require_relative 'min_max_stack_queue'

require 'byebug'

def windowed_max_range(arr, window_size)
  # start the queue with the first window_size elements
  q = MinMaxStackQueue.new
  (0...window_size).each { |i| q.enqueue(arr[i])}

  # debugger
  # establish the max
  max = q.max - q.min

  (window_size...arr.length).each do |i|
    el = arr[i]
    q.dequeue
    q.enqueue(el)
    max = [q.max - q.min, max].max
  end

  max
end



p windowed_max_range([1, 0, 2, 5, 4, 8], 2) #== 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) #== 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) #== 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) #== 6 # 3, 2, 5, 4, 8
