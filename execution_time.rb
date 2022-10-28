# my_min ######################################################################
# Given a list of integers find the smallest number in the list.

# Phase I
# First, write a function that compares each element to every other element of the list.
# Return the element if all other elements in the array are larger.
# What is the time complexity for this function?

def my_min1(list)
  list.each do |el|
    return el if list.all? { |other_el| el <= other_el }
  end
end


list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

p my_min1(list)

# time complexity is n * n => O(n^2)


# Phase II
# Now rewrite the function to iterate through the list just once while
# keeping track of the minimum. What is the time complexity?

def my_min2(list)
  list.inject() { |min, el| el < min ? el : min }
end

p my_min2(list)

# time complexity is n * n => O(n^2)
# my_min end ##################################################################


#Largest Contiguous Sub-sum ###################################################
# You have an array of integers and you want to find the largest contiguous
# (together in sequence) sub-sum.
# Find the sums of all contiguous sub-arrays and return the max.

#Example:

# Example 1:
  # list = [5, 3, -7]

  # p largest_contiguous_subsum(list) # => 8

  # possible sub-sums
    # [5]           # => 5
    # [5, 3]        # => 8 --> we want this one
    # [5, 3, -7]    # => 1
    # [3]           # => 3
    # [3, -7]       # => -4
    # [-7]          # => -7

# Example 2:
  # list = [2, 3, -6, 7, -6, 7]

  # largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

  # Example 3:

  # list = [-5, -1, -3]
  # largest_contiguous_subsum(list) # => -1 (from [-1])


  # Phase I
  # Write a function that iterates through the array and finds all sub-arrays using nested loops.
  # First make an array to hold all sub-arrays. Then find the sums of each sub-array and return the max.

  def largest_contiguous_subsum1(list)
    subarrays = []
    # n^2 time
    (0...list.length).each { |i|
      (0...list.length).each { |j|
        subarrays << list[i..j] if j >= i
    } }

    # this steps through n + (n-1) + (n-2) + ... + (1) subarrays with average length n / 2 and sums, so should be taking O(n^2) time
    subarrays.inject() { |max, subarray| subarray.sum > max.sum ? subarray : max }.sum
  end

  # Discuss the time complexity of this solution.
  # runtime is n^2

list1 = [5, 3, -7] #=> 8
list2 = [2, 3, -6, 7, -6, 7] #=> 8
list3 = [-5, -1, -3] #=> -1

p largest_contiguous_subsum1(list1)
p largest_contiguous_subsum1(list2)
p largest_contiguous_subsum1(list3)

######################################## End Phase I ###########################################

# Phase II
# Let's make a better version. Write a new function using O(n) time with O(1) memory. Keep a running tally of the largest sum.
# To accomplish this efficient space complexity, consider using two variables.
# One variable should track the largest sum so far and another to track the current sum. We'll leave the rest to you.

# Get your story straight, and then explain your solution's time complexity to your TA.


def largest_contiguous_subsum2(list)
  # # O(n)
  max_sum = -1/0.0
  sum_ending_here = 0

  # n * 3 => O(n)
  (0...list.length).each do |i|
    sum_ending_here = sum_ending_here + list[i]
    max_sum = sum_ending_here if sum_ending_here > max_sum
    sum_ending_here = 0 if sum_ending_here < 0
  end

  max_sum
end

# # O(1)
# j = list.length


# contiguous = []
  # #   sum += i0
  # #   largest_sum = [sum, largest_sum].max

  # # this loop iterates
  # (0...list.length).each do |i|
  #   (i...list.length).each do |j|
  #     cur_sum = list[i..j].sum
  #     largest_sum = cur_sum if cur_sum > largest_sum
  #   end
  # end

  # largest_sum
# end


p largest_contiguous_subsum2(list1)
p largest_contiguous_subsum2(list2)
p largest_contiguous_subsum2(list3)



















