# Given an array of numbers, for each number find out how many numbers
# in the array are smaller than that current number. When counting numbers, only count
# unique values. That is, if a given number occurs multiple times in
# the array, it should only be counted once.

# Examples:

# p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
# p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4])
#                             == [0, 2, 4, 5, 6, 1, 2, 3, 2]
# p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
# p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
# p smaller_numbers_than_current([1]) == [0]

# The tests above should print "true".



=begin
PROBLEM: Take an array of integers and count the unique occurances of
each smaller number in the array in an array of the same size
-Input: Array of integers
-Output: A transformation of each element based on a count of unique smaller integers
-Rules:
-Only count unique values

EXAMPLES:
# p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
# p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4])
#                             == [0, 2, 4, 5, 6, 1, 2, 3, 2]
# p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
# p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
# p smaller_numbers_than_current([1]) == [0]


THOUGHTS:
Checking each integer in array for a count of unique smaller occurances
Iterate with transformation behavior on each element
Want to transform each element in array based on that elements count of
unique elements in the array that are smaller than it

DATA STRUCTURE:
Array(to hold integers and to hold transformed values)

ALGORITHM:
-Iterate over each element in array
  -Transform each element based on a unique count of elements smaller than current
-Return this array

=end

#Alternate solution with select
def smaller_numbers_than_current(array)
  array.map do |number|
    array.select { |num| number > num }.uniq.count
  end
end

def smaller_numbers_than_current(array)
  array.map do |integer| 
    array.uniq.count { |uniq_int| integer > uniq_int }
  end
end

p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4]) == [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]
