# Given an array (array) of integers, find the maximum difference between a
# and a subsequent number in the array
#
# Time complexity: O(n)
# Space complexity: O(1)
#

# Set the smallest price we've seen so far, and then iterate through and:
# - compare the difference of each number to the current smallest number and
#   update if necessary
# - compare the smallest number we've seen so far, changing it if necessary
def largest_difference(array)
  min_element_so_far = array.first
  max_difference = 0

  array.each do |element|
    max_difference_for_element = element - min_element_so_far
    max_difference = [max_difference, max_difference_for_element].max
    min_element_so_far = [min_element_so_far, element].min
  end

  max_difference
end

# Time complexity O(n log n) alternative
# Divide and conquer
#
def largest_difference_divide_and_conquer(array)
  # To lower space complexity, I'll call "array[0..array.length / 2]" etc.
  # manually each time, but I'd rather store the subarrays as their own variable
  # to make the code cleaner
  max_difference_first = largest_difference_nested_iteration(array[0..(array.length / 2)])
  max_difference_second = largest_difference_nested_iteration(array[(array.length / 2 + 1)..(array.length - 1)])

  max_difference = [max_difference_first, max_difference_second].max
  [max_difference, (array[(array.length / 2 + 1)..(array.length - 1)].max - array[0..(array.length / 2)].min)].max
end

# This solution runs at O(n^2) but when utilized by the divide and conquer
# approach, it results in O(n log n)
def largest_difference_nested_iteration(array)
  max_difference = 0

  array.each_with_index do |element, i|
    array[i..(array.length - 1)].each do |subsequent_element|
      max_difference = [subsequent_element - element, max_difference].max
    end
  end
  max_difference
end
