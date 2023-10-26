=begin
Create a function named divisors that takes an integer n > 1 and returns an
array with all of the integer's divisors(except for 1 and the number itself),
from smallest to largest. If the number is prime return the string '(integer) is prime'

PROBLEM: 
Take an integer greater than 1 and return all equal divisors between 1 and input.
Exclude 1 and input. Sort from smallest to largest. Return string message if prime.

EXAMPLES:
divisors(12) == [2,3,4,6]
divisors(25) == [5]
divisors(13) == "13 is prime"

THOUGHTS:
-Iterate from 2 to one less than input
  -Push current integer onto new array if evenly divisible by input
-Return string if array is empty

DATA STRUCUTRES:
Array

ALGORITHM:
-Iterate over 2 to one less than input
  -Select current integer if evenly divisble by input
-If array is empty return string message
-Else return array

=end

def divisors(integer)
  array = (2...integer).select { |int| integer % int == 0 }
  array.empty? ? "#{integer} is prime" : array
end

p divisors(12) == [2,3,4,6]
p divisors(25) == [5]
p divisors(13) == "13 is prime"
