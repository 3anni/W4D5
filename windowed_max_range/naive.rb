# Windowed Max Range
# Given an array and a window size w, find the
# maximum range (max - min) within a set of w elements.

# Let's say we are given the array [1, 2, 3, 5] and a window size of 3.
# Here, there are only two cases to consider:
  # 1. [1 2 3] 5
  # 2. 1 [2 3 5]
# In 1, the difference between the max and min elements of the window is 3-1=2.
# In the second case, that difference is three (5 - 2 == 3).
# We want to write a function that will return the larger of these two differences.

require 'byebug'

def windowed_max_range(arr, window_size)
  best_max = nil

  (0..arr.length - window_size).each do |i|
    j = i + window_size - 1
    window = arr[i..j]
    current_max = window.max - window.min
    best_max = current_max if !best_max || current_max > best_max
  end

  best_max
end

arr = [1,2,3,5]
p windowed_max_range(arr, 3)


# time complexity is O(n^2)





