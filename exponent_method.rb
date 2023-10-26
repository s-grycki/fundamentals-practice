=begin
Create a method called "power" that takes two integers and returns the value of
 the first argument raised to the power
of the second. Return nil if the second argument is negative.
Note: The ** operator has been disabled.

PROBLEM:
Take two integers(input)
Return the first integer raised to the power of the second(output)
Return nil if second argument is negative(Explicit Rule)
The ** operator has been disabled(Explicit Rule)

EXAMPLES:

DATA STRUCTURES:
Input: Integers
Intermediate: Array(store first integer second integer times)
  Return 1 if empty array
  Return nil if second integer is negative
Output: Integers

THOUGHTS:


ALGORITHM:
Return nil if integer2 is negative
Set int_array to empty array
Populate a new array with integer1 integer2 times [2, 2, 2]
Return 1 if int_array is empty

Multiply each integer in int_array [2, 2, 2] => 8

=end

def power(int1, int2)
  return nil if int2.negative?

  int_array = []
  int2.times { |_| int_array << int1 }
  int_array.inject(:*) == nil ? 1 : int_array.inject(:*)
end

p power(2, 3) == 8
p power(10, 0) == 1
p power(-5, 3) == -125
p power(-4, 2) == 16
p power(10, 0) == 1
p power(2, 3) == 8
p power(3, 2) == 9
p power(-5, 3) == -125
p power(-4, 2) == 16
p power(8, -2) == nil
