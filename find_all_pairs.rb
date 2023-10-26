=begin
PROBLEM: Take an array of integers and count the number of elements which have
pairs - or two of the same number
-Input: Array of integers
-Output: Integer represnting same number pairs from array
-Rules:
-Return 0 if empty or 1 value
-Pairs come in 2's
-Maximum value is 1000

EXAMPLES:
pairs([1, 2, 5, 6, 5, 2]) == 2)
pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4)
pairs([0, 0, 0, 0, 0, 0, 0]) == 3
pairs([1000, 1000]) == 1
pairs([]) == 0
pairs([54]) == 0

THOUGHTS:
Need to iterate over each integer in array
Need a way to count the occurances of each unique number in array (hash?)
A valid pair is increased by every other addition to occurance (half the amount - division)

DATA STRUCTUES:
Array (of all integers), hash (to track indiivdual occurances of a number)

ALGORITHM:
  - Set hash to empty hash
  - Iterate over each number in array
    - If hash has the current number as a key
      - Increment value by 1
    - Else
      - Set hash key to number with value of 1

  - Return hash
  - Select values from hash divisble by 2 (this would delete odd counts)
  - Divide each value by 2 (this will automatically do floor division on pairs)
  - Return the sum of all elements

=end

def pairs(array)
  array.each_with_object({}) do |num, hash|
    if hash.key?(num)
      hash[num] += 1
    else
      hash[num] = 1
    end
  end.map { |_,val| val / 2 }.sum
end

#Second attempt
=begin
You are given array of integers, your task will be to count all pairs in 
that array and return their count.

PROBLEM:
EXAMPLES:
([1, 2, 5, 6, 5, 2]) => [2,2](1), [5,5](2) *Iterate through array of unique elements
([1, 2, 2, 20, 6, 20, 2, 6, 2]) => [1, 2, 20, 6] => [1](0), [2,2,2,2](2), [20,20](3), [6,6](4)
([0, 0, 0, 0, 0, 0, 0]) => [0] => [0,0,0,0,0,0,0](3) *Array size / 2
*If array size is 1 or less return 0

THOUGHTS:
-Iterate through array of unique elements
  -Want count of each element in original array / 2
  -Want to increment onto a counter

ALGORITHM:
-Return 0 if array size is 1 or less
-Set counter to 0
-Iterate through each unique integer in array [1, 2, 5, 6]
  -Count each element in original array divided by 2 (1/2), (2/2), (2/2), (1/2)
  -Increment this number onto counter 0, 1, 2, 2
-Return counter (2)

=end

def pairs(array)
  counter = 0

  array.uniq.each do |int|
    counter += array.count(int) / 2
  end
  
  counter
end

p pairs([1, 2, 5, 6, 5, 2]) == 2
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
p pairs([0, 0, 0, 0, 0, 0, 0]) == 3
p pairs([1000, 1000]) == 1
p pairs([]) == 0
p pairs([54]) == 0
