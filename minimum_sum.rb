=begin
# Write a method that takes one argument: an array of integers.
# The method should return the minimum sum of 5 consecutive
# numbers in the array. If the array contains fewer than 5
# elements, the method should return nil.

# Examples:

p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10

# The tests above should print "true".


PROBLEM: Take an array of integers and return the smallest sum of 5
consecutive integers. Return nil if fewer than 5 elements
-Input: Array of integers
-Output: smallest sum of 5 consecutive elements or nil
-Rules:
-Work with negatives

EXAMPLES:
p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10

THOUGHTS:
-Create groups of 5 starting at first index
-Want to go from 0 to length of array minus 5

DATA STRUCUTRES:
Array(to hold initial values, and array groups to be summed)

ALGORITHM:
-Set sub_arrays to empty array
-Iterate from 0 upto length of array minus 5 with an index
  -Push array from index to index + 4 onto sub_arrays

-Get min from sub_arrays
=end

def minimum_sum(array)
  return nil if array.size < 5
  sub_arrays = []

  0.upto(array.size - 5) do |idx|
    sub_arrays << array[idx..idx + 4].sum
  end
  
  sub_arrays.min
end

def minimum_sum(array)
  return nil if array.size < 5
  array.each_cons(5).map(&:sum).min
end

p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10
