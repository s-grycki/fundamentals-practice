=begin

Given an array of n positive integers and a positive integer, 
find the minimal length of a contiguous subarray for which the sum >= integer.

PROBLEM:
Take array of n positive integers and a positive integer as a target sum(input)
Return the minimum length of a contiguous subarray where sum >= integer(output)
integer is sum of subarray elements
Contiguous: Occuring in sequence
If nothing sums to target return 0 (Implicit Rule)

EXAMPLES:
([2, 3, 1, 2, 4, 3], 7) == 2 [4, 3]
([1, 10, 5, 2, 7], 9) == 1 [10]
([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4 [100, 1, 0, 200]
([1, 2, 4], 8) == 0

DATA STRUCUTURE:
Arrays: Subarrays as collection of elements to sum

THOUGHTS:
Could get all possible subarrays or return prematurely when subarray is at least target

ALGORITHM:
Get all possible subarrays
Check if sum of an subarray is greater than or equal to target
Return size of subarray if so
Else return 0

Iterate from 1 upto size of array (integer), (1,2,3)
  Get consecutive subarrays based on current integer [1], [2], [4], [1, 2], [2, 4], [1, 2, 4]
  Return size of current subarray if sum is greater than or equal to target [4, 3]
Return 0 if never returned [1, 2, 4], 8) == 0

=end

def minSubLength(array, target)
  1.upto(array.size) do |integer|
    array.each_cons(integer) { |arr| return arr.size if arr.sum >= target }
  end
  0
end

p minSubLength([2, 3, 1, 2, 4, 3], 7) == 2
p minSubLength([1, 10, 5, 2, 7], 9) == 1
p minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
p minSubLength([1, 2, 4], 8) == 0
