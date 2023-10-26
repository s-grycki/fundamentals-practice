=begin
PROBLEM: Take an array of integers and sum the elements. Use this to find
the closest prime number and insert the number that will allow the array
to equal this prime number
-Input: Array of integers
-Output: The number we want to insert
-Rules:
-Array size at least 2
-Array will only have positives
-Repeat elements in the array could occur
-If sum is already prime then return 0
-Lowest possible number is 2 [1, 1]

EXAMPLES:
minimum_number([3,1,2]) == 1
minimum_number([5,2]) == 0
minimum_number([1,1,1]) == 0
minimum_number([2,12,8,4,6]) == 5
minimum_number([50,39,49,6,17,28]) == 2

THOUGHTS:
-Need forumla to find a prime number (sum % n == 0) where n is
an iteration of ranges from last prime number until true
-Iterate from 2 to the current sum minus 1 (to void self and 1)
-Next prime minus sum of array values is number we want

ALGORITHM:
-Iterate over every integer in array
  -Get sum of values

-Loop from 2 to sum - 1
  -Set prime_check to evaluation of ALL nums in range not being divisble by sum
  -Break sum if prime_check is true
  -Else increment sum by 1
-End loop

-Return sum minus original sum of array
=end

def minimum_number(arr)
  sum = arr.sum
  
  loop do
    prime_check = (2..(sum - 1)).all? { |n| sum % n != 0 }
    break sum if prime_check
    sum += 1
  end

  sum - arr.sum
end


#Second attempt
=begin
Given a List [] of n integers , find minimum number to be inserted in a list,
so that sum of all elements of list should equal the closest prime number.
Notes
List size is at least 2 .
List's numbers will only positives (n > 0) .
Repetition of numbers in the list could occur .
The newer list's sum should equal the closest prime number . 

PROBLEM: Take an array of integers and return the integer needing to be inserted
that will equae to the next prime number (all positive). Return 0 if sum is
already prime

EXAMPLES:
([3,1,2]) => 6 (2..5 - some have 0 remainders) => 7 (+= 1) => 1
([2,12,8,4,6]) => 32 .. (2..36) => 37 => += 5

THOUGHTS:
-Return 0 if sum of array is already prime
-(2..n - 1) if none have 0 remainder from self it's prime
  -Add 1 to sum otherwise
-Return difference of incrementing sum and original sum input

ALGORITHM:
-Set sum to sum of array values [3,1,2] => 6
-Until all sum - 1 % 2 != 0 (2...sum) (2...5) 6 % 2 == 0. (2..6) 
  -sum += 1
-Return sum - sum of input array (1)

=end

def minimum_number(array)
  sum = array.sum
  until (2...sum).all? { |divider| sum % divider != 0 }
    sum += 1
  end
  sum - array.sum
end


p minimum_number([3,1,2]) == 1
p minimum_number([5,2]) == 0
p minimum_number([1,1,1]) == 0
p minimum_number([2,12,8,4,6]) == 5
p minimum_number([50,39,49,6,17,28]) == 2


#Alternate solution with prime class
require 'prime'
def minimum_number(array)
  array_sum = array.sum

  loop do
    return array_sum - array.sum if array_sum.prime?
    array_sum += 1
  end
end



p minimum_number([3,1,2]) == 1
p minimum_number([5,2]) == 0
p minimum_number([1,1,1]) == 0
p minimum_number([2,12,8,4,6]) == 5
p minimum_number([50,39,49,6,17,28]) == 2
