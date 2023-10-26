=begin
Given a number , Return _The Maximum number _ could be formed from the 
digits of the number given
Assume only positive integers will be passed to method
Duplicate digits can and will appear



PROBLEM: 
Take an integer and return the largest integer that can be formed from
rearranging the digits

EXAMPLES:
maxNumber(213) == 321
maxNumber(7389) == 9873
maxNumber(63729) == 97632
maxNumber(566797) == 977665
maxNumber(17693284) == 987654321

THOUGHTS:
-Could just sort in decending order and return as integer

DATA STRUCUTRES:
Array

ALGORITHM:
-Iterate over each digit in input as an array element
  -Sort in decending order and return as integer

=end

def maxNumber(integer)
  integer.digits.sort { |a,b| b <=> a }.join.to_i
end

def maxNumber(integer)
  integer.digits.sort_by { |digit| digit.to_s }.reverse.join.to_i
end

p maxNumber(213) == 321
p maxNumber(7389) == 9873
p maxNumber(63729) == 97632
p maxNumber(566797) == 977665
p maxNumber(17693284) == 98764321
