# Given an array (array) and an index (i), perform a single partition so that
# all numbers less than array[i] precede it and all numbers to the right
# follow it.
#
# Time complexity: O(n)
# Space complexity: O(1)
#

# Apply the first step of quicksort
def single_partition(array, i)
  pivot = array[i]

  # Keep the following subarrays:
  # Bottom: elements smaller than the pivot (index < `small`)
  # Middle: elements equal to the pivot (index between `small` and `equal`)
  # Unclassified: elements that haven't been compared yet (index between `equal`
  # and `large`)
  # Top: elements larger than the pivot (index > `large`)
  small, equal, large = 0, 0, array.length - 1

  # array[equal] is the next Unclassified element. Iterate until there are none
  while equal <= large
    if array[equal] == pivot
      equal += 1
    elsif array[equal] < pivot
      array[equal], array[small] = array[small], array[equal]
      equal += 1
      small += 1
    else # array[equal] must be larger than pivot
      array[equal], array[large] = array[large], array[equal]
      large -= 1
    end
  end

  array
end
