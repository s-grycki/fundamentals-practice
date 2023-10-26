=begin
Write a function with the signature shown below:
def is_int_array(arr)
  true
end

returns true / True if every element in an array is an integer or a float with no decimals.
returns true / True if array is empty.
returns false / False for every other input.

PROBLEM:
Take an array of elements(input)

Return true if all elements are integers or floats without decimals (awkward)
Return true if array is empty ([])
Return false in every other case (if array isn't all non-decimal numbers)

Boolean(output)

Implicit Rule:
9 == 9.0 (if float is all zeroes after decimal)
Convert float to integer if float type and store in new variable
Compare to original float (9 == 9.0, 9 =/= 9.01)
*My infered understanding with Ruby

EXAMPLES:
val = 2.0.to_i
int(2.0) == 2 #true

DATA STRUCTURES:
Input: Array
Intermediate: Working with individual elements
Output: Boolean (only ever true if array is empty or all non-decimal numbers)

THOUGHTS:


ALGORITHM:
Return false unless all elements are integers or floats
Check if array with all elements transformed to integers equals self

=end

def is_int_array(array)
  return false unless array.all? { |elem| elem.class == Integer || elem.class == Float }
  array.map(&:to_i) == array
end

p is_int_array([]) == true # array is empty
p is_int_array([1, 2, 3, 4, 5]) == true # array is all integers
p is_int_array([1, 2.0, 3, 4, 5]) == true # all floats are equal to integer counter parts
p is_int_array([1, 2.01, 3, 4, 5]) == false # float is not equal to integer counter part
p is_int_array(['a', 'b', 'c']) == false # not all types are integers or floats
p is_int_array([1, 2, 3, 4, true]) == false # true class is not valid
