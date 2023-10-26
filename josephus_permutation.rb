=begin
# You are now to create a function that returns a Josephus permutation, 
# taking as parameters:

# the initial array/list of items to be permuted *as if they were in a circle* 

# k: items will be counted out every k places until none remained.

# Task is to return an array where the elements from an input array are collected 
# as they are removed every (n) element until the input array is empty.


# input: an array of integers, an integer k

# output: an array of integers


# >>>>>> Caveats

# Tips and notes: it helps to start counting from 1 up to n, instead of the 
# usual range 0..n-1; k will always be >=1.

# >>>>>> Examples and test cases

# For example, with n=7 and k=3 josephus(7, 3) should act this way.

# [1, 2, 3, 4, 5, 6, 7] - initial sequence
# [1, 2, 4, 5, 6, 7] => 3 is counted out and goes into the result [3]
# [1, 2, 4, 5, 7] => 6 is counted out and goes into the result [3, 6]
# [1, 4, 5, 7] => 2 is counted out and goes into the result [3, 6, 2]
# [1, 4, 5] => 7 is counted out and goes into the result [3, 6, 2, 7]
# [1, 4] => 5 is counted out and goes into the result [3, 6, 2, 7, 5]
# [4] => 1 is counted out and goes into the result [3, 6, 2, 7, 5, 1]
# [] => 4 is counted out and goes into the result [3, 6, 2, 7, 5, 1, 4]
# So our final result is:

# josephus([1, 2, 3, 4, 5, 6, 7], 3)

PROBLEM:
Take an array of integers and an integer representing items counted out k places until none left(Input)
Return an array where elements from input are collected in the order they're removed(Output)
Stop process when array is empty(Explicit Rule)
K will always be at least 1(Explicit Rule)
Work with position in array, not index in array(Implicit Rule)
Dynamically rotate array when deciding which element to delete(Implicit Rule)

Definitions: 
Permutation: The action of changing the arrangement of a set of items
Josephus Permutation: Like a circular counting out game or Russian Roulette
EXAMPLE: ([1, 2, 3, 4, 5], 1)

        1               2             2      
     5     2    =>    5   3   =>    5   4   =>    2   4   =>  4     => [1,3,5,2,4]
      4   3             4


EXAMPLES:
([1, 2, 3, 4, 5, 6, 7], 3) => [4,5,6,7,1,2], [3] => [7,1,2,4,5], [3,6] => [4,5,7,1], [3,6,2] =>
[1,4,5], [3,6,2,7] => [1,4], [3,6,2,7,5] => [4], [3,6,2,7,5,1]


DATA STRUCTURES:
Input: Array of integers and second integer to help with continuous rotation
Intermediate: Rotating array of input
Output: Array of integers in order based on deletion from input
Helper: Array to push deleted values onto

THOUGHTS:
Rotate k-1 times and first element should be deleted
Rotate k times and last element should be deleted

ALGORITHM:
First pass:
Rotate input and delete associated value from array until input is empty
Push deleted value onto a new array
Return new array

Second pass:
Set new_arr to empty array
Until input is empty ([1, 2, 3, 4, 5, 6, 7]), [4,5,6,7,1,2] ...
  Rotate k elements ([4,5,6,7,1,2,3]), [7, 1, 2, 4, 5, 6]
  Delete last element from array (3), (6)
  Push element onto new_arr [3], [3,6]
  Return rotated array [4,5,6,7,1,2], [7, 1, 2, 4, 5]
Return new_arr (output)

=end

def josephus(last, k)
  array = (1..last).to_a
  new_arr = []

  until array.empty?
    array = array.rotate(k)
    new_arr << array.pop
  end

  new_arr
end

p josephus(7, 3) == [3, 6, 2, 7, 5, 1, 4]
