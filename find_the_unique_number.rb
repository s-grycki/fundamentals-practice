=begin
PROBLEM: Take an array of numbers and return the one number that is unique
-Input: Array of integers with all but one the same
-Output: The unique number
-Rules:
-All arrays will countain at least 3 numbers
-Think about performance

EXAMPLES:
find_uniq([1,1,1,1,0]) == 0
find_uniq([ 1, 1, 1, 2, 1, 1 ]) == 2
find_uniq([ 0, 0, 0.55, 0, 0 ]) == 0.55

THOUGHTS:
-We're iterating over an array of numbers
-What we need is a way to count which element appears once
  -Count the occurance of each element and return once it equates to 1

DATA STRUCTURES:
Array(to contain all numbers)

ALGORITHM:
-Iterate over each number in array
  -Count the occurances of the current number in the array
  -Return number if it equals 1

=end

def find_uniq(array)
  array.each { |num| return num if array.count(num) == 1 }
end


p find_uniq([1,1,1,1,0]) == 0
p find_uniq([ 1, 1, 1, 2, 1, 1 ]) == 2
p find_uniq([ 0, 0, 0.55, 0, 0 ]) == 0.55



# Second attempt
=begin
PROBLEM: Take an array of numbers and return the one number that doesn't
equal the others
-Input: Array of integers with one unique value. Rest same
-Output: Unique value occuring only once
-Rules:
-Array will always contain at least 3 numbers

EXAMPLES:
find_uniq([1,1,1,1,0]) == 0
find_uniq([ 1, 1, 1, 2, 1, 1 ]) == 2
find_uniq([ 0, 0, 0.55, 0, 0 ]) == 0.55

THOUGHTS:
Checking for the number in the array that appears only once
Iterate over an array of unique elements and count occurances of each unique number
in original array. The number that returns 1 is what we want to return

DATA STRUCTURES:
Array(to hold original numbers and the two unique numbers)

ALGORITHM:
-Iterate over each unique number in array
  -Return the number with a count of 1 in the original array

=end

def find_uniq(array)
  array.uniq.each { |int| return int if array.count(int) == 1 }
end


p find_uniq([1,1,1,1,0]) == 0
p find_uniq([ 1, 1, 1, 2, 1, 1 ]) == 2
p find_uniq([ 0, 0, 0.55, 0, 0 ]) == 0.55
