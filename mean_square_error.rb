=begin
(https://www.codewars.com/kata/51edd51599a189fe7f000015/train/ruby)
Complete the function that
accepts two integer arrays of equal length
compares the value each member in one array to the corresponding member in the other
squares the absolute value difference between those two values
and returns the average of those squared absolute value difference between each member pair.
Examples
[1, 2, 3], [4, 5, 6] --> 9 because (9 + 9 + 9) / 3
[10, 20, 10, 2], [10, 25, 5, -2] --> 16.5 because (0 + 25 + 25 + 16) / 4
[-1, 0], [0, -1] --> 1 because (1 + 1) / 2


PROBLEM:
Take 2 integer arrays of equal length(input)
Compare the corresponding memebers of each array
Square the absolute difference (absolute value of difference then square it)
Return the average of the squared absolute difference between each pair(output)
Need to return float if it doesn't evenly divide(Implicit Rule)
Return integer if float ends in single zero (if float equals integer equivalent)

EXAMPLES:
[1, 2, 3], [4, 5, 6] => abs(1-4) => 3 ** 2 => 9 (9 + 9 + 9) / 3 => 9
(0 + 25 + 25 + 16) / 4.0 => 16.5
(1 + 1) / 2 => 1

DATA STRUCTURES:
Input: Array
Intermediate: Accumulator to keep incrementing sums and divide (Array or 0)
Output: Integer

THOUGHTS:

ALGORITHM:
Set accum to empty array
Iterate over one of the arrays with an index [1, 2, 3] (0)
  Get element at current index out of both arrays (1,4)
  Subtract absolute value and square it (abs(1 - 4)) ** 2
  Push it onto accum [9]

Sum each value in accum and divide by size (Return) [9, 9, 9] [9 + 9 + 9] / 3 => 9

=end

def solution(array1, array2)
  accum = []

  array1.each_with_index do |int, idx|
    accum << ((int - array2[idx]).abs) ** 2
  end

  ans = accum.sum / accum.size.to_f
  ans.to_i == ans ? ans.to_i : ans
end

p solution([1, 2, 3], [4, 5, 6]) == 9
p solution([10, 20, 10, 2], [10, 25, 5, -2]) == 16.5
p solution([-1, 0], [0, -1]) == 1
