=begin
In this kata, you must create a digital root function.
A digital root is the recursive sum of all the digits in a number. Given n, 
take the sum of the digits of n. If that value has more than one digit, 
continue reducing in this way until a single-digit number is produced. 
This is only applicable to the natural numbers.
Here's how it works:
digital_root(16)
=> 1 + 6
=> 7
digital_root(942)
=> 9 + 4 + 2
=> 15 ...
=> 1 + 5
=> 6
digital_root(132189)
=> 1 + 3 + 2 + 1 + 8 + 9
=> 24 ...
=> 2 + 4
=> 6
digital_root(493193)
=> 4 + 9 + 3 + 1 + 9 + 3
=> 29 ...
=> 2 + 9
=> 11 ...
=> 1 + 1
=> 2

PROBLEM:
Take n(input)
Return single digit representing recursive sum(output)

Digital root: Recursive sum of all digits in a number
Recursive in this context: sum of each individual digit updated until only a single integer left

Implicit Rules:
Return self if integer is single digit 7 => 7
Natural numbers only: 0 and positive
Assume no negative inputs

EXAMPLES:
1 + 6 = 7 (single integer)
4 + 5 + 6 = 15 (not single integer) => 1 + 5 = 6 (single integer)

DATA STRUCTURES:
Input: Integer with multiple digits
Intermediate: Array (to break into individual digits)
Output: Integer with a single digit

THOUGHTS:
Can't do array size minus 1 because integer size will shrink faster than this


ALGORITHM:
Split input to an array of digits [1,6], [4,5,6]
Return input if array size is 1

Iterate until array size is 1 [4,5,6] => (4, 5, 6), [1,5] => (1, 5) [6]
  Sum each integer and return to array (4 + 5 + 6) = 15 => [1, 5] (1 + 5) = 6 => [6]
Get integer out of the array => 6

=end

def digital_root(integer)
  int_arr = integer.digits.reverse # [4,5,6]
  return integer if int_arr.size <= 1

  until int_arr.size == 1 # [4, 5, 6], [1, 5], [6](true)
    int_arr = int_arr.sum.digits # 15 => [1, 5], 6 => [6]
  end

  int_arr.first # [6] => 6
end

p digital_root(16) == 7
p digital_root(456) == 6
p digital_root(942) == 6
p digital_root(132189) == 6
p digital_root(493193) == 2
