=begin
https://leetcode.com/problems/check-if-array-is-sorted-and-rotated/

Given an array nums, return true if the array was originally sorted in 
non-decreasing order, then rotated some number of positions (including zero). 
Otherwise, return false.

There may be duplicates in the original array.

Note: An array A rotated by x positions results in an array B of the same 
length such that A[i] == B[(i+x) % A.length], where % is the modulo operation.

PROBLEM:
Take an array of integers(input)
Return true if array was originally in accending order, or rotated some number of
positions in order to get accending order. False otherwise(output)
There may be duplicates(Explicit Rule)

Array(A) rotated x positions results in array(B) of same length
A[i] == B[(i+x) % A.length]
i: index
x: rotations
A: Original array
B: Array rotated

[3,4,5,1,2] (A)
A[1] == A[2 % 5] (A[2])
4    ==     5   

A[0] == [3,4,5,1,2][1] *Makes sense because it's being rotated once
3    ==    4
*We need index so we know where to start rotating

EXAMPLES:
[3,4,5,1,2] => Can rotate twice and array will have values in all accending order
[2,1,3,4] => Rotate full length of array and never in accending order

DATA STRUCTURES:
Array(input)
Array(intermediate - rotating array length times)

THOUGHTS:

ALGORITHM:
Return true if all elements are in accending order
Rotate array length of array times and return true if all elements are ever in accending order
Return false if never true

Return true if array sorted equals self [1, 2, 3] == self
Set iterations to range (1..array size) (1..5)
Iterate over each number in iterations (1,2,3,4,5)
  return true if array rotated number times equals array sorted (2) [1,2,3,4,5] == self
Return false otherwise

=end

def check(array)
  return true if array.sort == array

  iterations = (1..array.size)
  iterations.each do |int|
    return true if array.rotate(int) == array.sort
  end

  false
end

#Refactored solution
def check(array)
  (0...array.size).each do |int|
    return true if array.rotate(int) == array.sort
  end

  false
end

p check([3,4,5,1,2]) == true
p check([2,1,3,4]) == false
p check([1, 2, 3]) == true
