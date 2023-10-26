=begin
PROBLEM: Take 2 arrays and check if array b has ALL the elements from array a squared,
regardless of order
-Input: Array a with numbers, Array b which should have all numbers from array a squared
-Output: Boolean if array b has ALL elements squared
-Rules:
-Order doesn't matter
-ALL elements must match else it's false

EXAMPLES:
comp( [121, 144, 19, 161, 19, 144, 19, 11], 
      [11*11, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19]) ==
  true

comp( [121, 144, 19, 161, 19, 144, 19, 11], 
      [132, 14641, 20736, 361, 25921, 361, 20736, 361]) ==
  false

THOUGHTS:
-Iterate over array a and square each element
-Need a way to check for equivalency regardless of array order
  -We could sort both arrays

DATA STRUCTURES:
Arrays (to hold squared numbers and numbers to be squared)

ALGORITHM:
-Iterate over each element in array a and transform to squares of self
-Sort array a and array b
-Check for array equivalency

=end

def comp(array_a, array_b)
  array_a = array_a.map { |int| int * int }
  array_a.sort == array_b.sort
end



=begin

PROBLEM: Take two arrays of integers and return a boolean based on whether
each element in array 1 is shared with array 2 with their elements squared
-Input: 2 arrays. Array 1 has non-squared values. Array 2 has squared values
-Output: Boolean based on if every element in array 2 is in array 1, but with
all elements squared
-Rules:
-Can I assume that this will always be an array of integers and both will have
the same number of elements?

EXAMPLES:
comp([121, 144, 19, 161, 19, 144, 19, 11], 
  [11*11, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19]) == true


THOUGHTS:
I'm checking if each number in array 2 squared is present in array 1
Iterate over array 1 so I can square each element

DATA STRUCTURE:
Arrays(to hold non-squared and squared values)

ALGORITHM:
-Iterate over each number in array 2
  -Transform to squares of self
-Check of array 1 equals array 2

EXTRA THOUGHT:
If we were given arrays with unequal number of elements, we could iterate with
an index and return false at the start of the block if the current index at
array1 or array2 equated to nil. This wasn't an issue here, but It's a thought
I had

=end

def comp(array1, array2)
  array1.map { |num| num*num }.sort == array2.sort
end


p comp( [121, 144, 19, 161, 19, 144, 19, 11], 
  [11*11, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19]) ==
true

p comp( [121, 144, 19, 161, 19, 144, 19, 11], 
  [132, 14641, 20736, 361, 25921, 361, 20736, 361]) ==
false
