=begin

The maximum sum subarray problem consists in finding the maximum sum of a
contiguous subsequence of an array of integers.
Easy case is when input array is all positive, then return total sum of array. 
If total array is made up of only negative numbers, return 0 instead. 
Empty array assumed to have 0 greatest sum. Note the empty array is also a valid subarray.

max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
max_sequence([]) == 0 
max_sequence([11] == 11
max_sequence([-32] == 0 
max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4] == 12

PROBLEM: Get all possible consecutive digit groups from an array of integers and
return the largest sum from the sum of all of these groups. If all negative return 0.
If all positive, return total sum. If empty array, return 0

EXAMPLES:
max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
max_sequence([]) == 0 
max_sequence([11] == 11
max_sequence([-32] == 0 
max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4] == 12

THOUGHTS:
-Need guard clause for empty or all negative elements
-Need guard clause for all positive elements
-Need to get sums of all possible consecutive groups

DATA STRUCUTRES:
Array(to store possible sums)

ALGORITHMS:
-Return 0 if input is empty OR all negative elements
-Return sum of all elements if all positive elements

-Set sums_array to empty array
-Iterate from 0 upto array size minus 1 with outer_idx
  -Iterate from outer_idx plus 1 upto array size minus 1 with inner_idx
    -Push sum of input array from outer_idx to inner_idx onto sums_array
-Get max from sums_array

=end

def max_sequence(array)
  return 0 if array.empty? || array.all?(&:negative?)
  return array.sum if array.all?(&:positive?)

  sums_array = []
  0.upto(array.size - 1) do |outer_idx|
    (outer_idx + 1).upto(array.size - 1) do |inner_idx|
      sums_array << array[outer_idx..inner_idx].sum
    end
  end
  sums_array.max
end

p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
p max_sequence([]) == 0 
p max_sequence([11]) == 11
p max_sequence([-32]) == 0 
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12
