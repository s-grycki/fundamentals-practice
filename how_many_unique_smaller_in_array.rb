# Given an array of numbers, for each number find out how many numbers
# in the array are smaller than it. When counting numbers, only count
# unique values. That is, if a given number occurs multiple times in
# the array, it should only be counted once.

# Examples:

#p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
#p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4]) == [0, 2, 4, 5, 6, 1, 2, 3, 2]
#p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
#p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
#p smaller_numbers_than_current([1]) == [0]

# The tests above should print "true".

=begin
PROBLEM: Take an array of numbers and for each number, find out how many other numbers
in the array are smaller than it. Only count unique values with comparison
-Input: Array of numbers
-Output: An array of the same number of elements replaced by count of smaller numbers
-Rules:
-Output should have the same number of elements
-0 if all self in array or only one element

EXAMPLES:
p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4])
                            == [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]

THOUGHTS:
-Want to iterate over each number in array with an index to track current element
-Want to transform each element based on a count of being greater than each other element
-Transform each element based on how many unique values are less than it
-I want to compare each element with every other element in array without counting duplicates

DATA STRUCUTRES:
-Array (to hold initial values and transformed values)

ALGORITHM:
-Iterate over each number in array
  -Transform each element with a count of unique values less than current number
=end

def smaller_numbers_than_current(array)
  array.map do |outer_num|
    array.uniq.count { |inner_num| outer_num > inner_num }
  end
end


p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4]) == [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]
