=begin
Given an array of integers, Find the minimum sum which is obtained from 
summing each Two integers product
Array will contain positives only
Array will always have even size

PROBLEM: 
Get the smallest possible sum from multiplied pairs of integers in an array

EXAMPLES:
minSum([5,4,2,3]) == 22
minSum([12,6,10,26,3,24]) == 342

THOUGHTS:
-Multiply smallest integer with largest integer until all are multiplied
-Get min/max from array half size of array times
  -Multiply the pairs together and sum them
-Delete min and max from array on each iteration
  -Store in new array

DATA STRUCUTRES:
Arrays

ALGORITHM:
-Set pairs_array to empty array
-Iterate array size divided by 2 times
  -Set pair_array to empty array
  -Delete min from array and push onto pair_array
  -Delete max from array and push onto pair_array
  -Push pair_array onto pairs_array
-Multiply each pair in pairs_array and return the sum

=end

def minSum(array)
  pairs_array = []
  (array.size / 2).times do
    pair_array = []
    pair_array.push(array.delete(array.min), array.delete(array.max))
    pairs_array << pair_array
  end
  pairs_array.map { |pair| pair.inject(:*) }.inject(:+)
end

p minSum([5,4,2,3]) == 22
p minSum([12,6,10,26,3,24]) == 342
