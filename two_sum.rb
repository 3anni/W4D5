require 'byebug'


# two_sum?
# Given an array of unique integers and a target sum, determine
# whether any two integers in the array sum to that amount.

def bad_two_sum?(arr, target_sum)
  (0...arr.length).each do |i|
    (0...arr.length).each do |j|
      if i != j && arr[i] + arr[j] == target_sum
        return true
      end
    end
  end

  false
end

# O(n^2)

def okay_two_sum?(arr, target_sum)
  sorted = arr.sort # n log n

  sorted.each_with_index do |el, i| # n log n
    delta = target_sum - el
    return true unless (sorted[0...i] + sorted[i+1..-1]).bsearch { |el| delta <=> el }.nil?
  end

  false
end

# O(n log n)

def hash_builder(arr)
  h = Hash.new { |h, k| h[k] = []}
  arr.each_with_index { |el, i| h[el] << i }
  h
end


def two_sum?(arr, target_sum)
  h = hash_builder(arr)
  arr.each_with_index do |el, i|
    delta = target_sum - el
    h_of = h[delta]
    # debugger
    return true unless h_of.empty? || h_of == [i]
  end

  false
end

# n + n

arr = [0, 1, 5, 7]
p bad_two_sum?(arr, 6) # => should be true
p bad_two_sum?(arr, 10) # => should be false


p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false



p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false


