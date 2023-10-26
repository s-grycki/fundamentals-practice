=begin
You are given an array (which will have a length of at least 3, but could be very large) 
containing integers. The array is either entirely comprised of odd integers or entirely 
comprised of even integers except for a single integer N. Write a method that takes 
the array as an argument and returns this "outlier" N.
Examples
[2, 4, 0, 100, 4, 11, 2602, 36] == 11
Should return: 11 (the only odd number)
[160, 3, 1719, 19, 11, 13, -21] == 160
Should return: 160 (the only even number)

PROBLEM:
Take an array of at least 3 integers(input)
Return the outlier as an integer(output)
Array is entirely odd or even except for one value(Explicit Rule)
Negatives can appear in array(Implicit Rule)

EXAMPLES:

DATA STRUCTURES:
Input: An array of at least 3 integers (all odd or even except for one)
Intermediate: -
Output: Integer (only odd or even value from the array)

THOUGHTS:
Could just filter based on all being even or all being odd and return result with 1 element

ALGORITHM:
If only one even value in array
  Select even value and return as integer

If only one odd value in array
  Select even value and return as integer

=end

def parity(array)
  if array.one?(&:even?)
    return array.select(&:even?).first
  else
    return array.select(&:odd?).first
  end
end

p parity([2, 4, 0, 100, 4, 11, 2602, 36]) == 11
p parity([160, 3, 1719, 19, 11, 13, -21]) == 160
