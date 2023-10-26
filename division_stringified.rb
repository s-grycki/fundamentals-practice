=begin
# Have the method division_stringified(num1, num2) take both parameters being passed, divide num1 by num2, and return the result as a string with properly formatted commas.
#
# If an answer is only 3 digits long, return the number with no commas.

# Example: if num1 is 123456789 and num2 is 10000 the output should be "12,346".
#
# Note: 2 divided by 3 should return '1'

PROBLEM:
Take num1 and num2(input)
Divide num1 by num 2, and return result as string with commas as appropriate(output)
Start formating with commas when integer size is 4 or greater
Perform ceiling division instead of floor division(Implicit Rule)
Perform ceiling division when remainder is 0.5+
Perform floor division when remainder is less than 0.5

EXAMPLES:


DATA STRUCTURE:
Array(maybe if integer size is at least 4)

THOUGHTS:
If digit is 4 in size, comma after 1st digit (1,000) 
If digit is 5 in size, comma after 2nd digit (10,000)
If digit is 6 in size, comma after 3rd digit (100,000)
1,000,000, 10,000,000, 100,000,000 (1,4), (2,5), (3,6)
1,000,000,000, 10,000,000,000, 100,000,000,000 (1,4,7), (2,5,8), (3,6,9)
If integer size is greater than 4
  Split string according to 3 zeros preserved

ALGORITHM:
Get remainder from 2 numbers (float division) (100000 / 1.0 = 0) (2 / 3.0 = 0.66)
Divide num1 by num2 (100000 / 1 = 100000) (2 / 3 = 0)
Add 1 to division if remainder is 0.5 or greater (100000 + 0 = 1) (0 + 1 = 1)
Return division as string "100000"
Split division by 3 0s preserved /(000)/ => [1, 000, 00]
If last element has less than 3 0s
  Delete last element from array and add to first element [100,000]
Join array back into string '100,000'

=end

def division_stringified(num1, num2)
  remainder = (num1 % num2.to_f) / num2
  division = num1 / num2
  division += 1 if remainder >= 0.5
  division = division.to_s

  if division.size >= 4
    division = division.reverse.split(/(.{3})/).reverse.map(&:reverse)
    division = division.reject { |elem| elem.empty? }.join(',')
  end

  division
end

p division_stringified(2, 3) == "1" # remainder 0.66 
p division_stringified(5, 2) == "3" # remainder 0.5
p division_stringified(7, 3) == "2" # remainder 0.33
p division_stringified(6874, 67) == "103" # remainder 40/67 > 0.5
p division_stringified(1, 10) == "0" # remainder 0.1
p division_stringified(503394930, 43) == "11,706,859" # 36/43 > 0.5
p division_stringified(100000, 1) == "100,000"






# Second attempt
=begin
Have the method division_stringified(num1, num2) take both parameters being 
passed, divide num1 by num2, and return the result as a string with properly formatted commas.

If an answer is only 3 digits long, return the number with no commas.

Example: if num1 is 123456789 and num2 is 10000 the output should be "12,346".

Note: 2 divided by 3 should return '1'

PROBLEM:
Take num 1 and num 2(Input)
Divide num 1 by num 2 and return string of result with proper comma format(Output)
Only insert commas if answer is at least 4 digits long(Explicit Rule)

Question: Why does 2 / 3 return 1? What would 1 / 3 return? *Might be answered in examples*
Round answer if remainder is 0.5 or greater(Implicit Rule)

EXAMPLES:
503394930, 43 => 11706859 => "95860711" => 958, 607, 11 => 11,706,859
100000, 1 => 100000 => "000001" => 000, 001 => 100,000

THOUGHTS:
Use rounded division with floats first
How do I know where to insert commas?
  Starting from end, insert commas after every third digit (3,6,9 etc.)
  Could reverse input to make this easier

DATA STRUCTURES:
Input: Two integers (numerator and denominator)
Intermediate: Array or string (To handle insertion behavior)
Output: String integer seperated by commas (if size is at least 4)
Helper: -

ALGORITHM:
First Pass:
Divide numbers and add 1 if remainder is greater than half (5 / 2.0 == 2.5 => 3)
Iterate over each digit in division as string character reversed "95860711"
  Insert comma if third digit "958,607,11"
Return reversed digit string "11,706,859"

Second Pass:
Set integer to float division of int1 and int2 (503394930 / 43.0 == 11706858.84)
Add 1 to integer if remainder is greater than half (11706859)
Set integer to a reversed string "95860711"
Split integer into slices of 3 as a nested array [["9", "5", "8"], ["6", "0", "7"], ["1", "1"]]
Join each subarray into a string with a comma ["958,697,11"]
Reverse order and return as string "11,706,859"

=end

def division_stringified(int1, int2)
  integer = (int1/int2.to_f).round
  integer = integer.to_s.reverse
  integer = integer.chars.each_slice(3).map(&:join)
  integer.join(',').reverse
end


p division_stringified(2, 3) == "1" # 2 / 3 == 1 (0.6666)
p division_stringified(5, 2) == "3" # 5 / 2 == 3 (2.5)
p division_stringified(7, 3) == "2" # 7 / 3 == 2 (2.333)
p division_stringified(6874, 67) == "103" # 6874 / 67 == 103 (~102.6)
p division_stringified(503394930, 43) == "11,706,859"
p division_stringified(1, 10) == "0" # 1 / 10 == 0 (0.1)
p division_stringified(100000, 1) == "100,000"
