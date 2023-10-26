=begin
PROBLEM: Take an array of integers and find the ONLY one that appears an
odd number of times
-Input: Array of integers where all appear an even number of times except for one of them
-Output: The number that appears an odd number of times
-Rules:
-Return integer if array has one element
-Only one number will ever appear an odd number of times

EXAMPLES:
find_it([20,1,-1,2,-2,3,3,5,5,1,2,4,20,4,-1,-2,5]) == 5
find_it([1,1,2,-2,5,2,4,4,-1,-2,5]) == -1
find_it([20,1,1,2,2,3,3,5,5,4,20,4,5]) == 5
find_it([10]) == 10
find_it([1,1,1,1,1,1,10,1,1,1,1]) == 10

THOUGHTS:
-Iterate over each integer in array
-We need a way to count occurances on each iteration
  -We could count occurances of current element for each iteration
  -We could use a hash to increment values and return the odd key
-We can stop iterating once we find the odd number

DATA STRUCTURES:
Array (to hold every integer to be counted)

ALGORITHM:
-Iterate over each number in input array and convert to count of occurances of each element
-Iterate over each element in this array with index
  -Return element at index from original array if it's odd

=end

def find_it(array)
  count_array = array.map { |int| array.count(int) }
  count_array.each_with_index { |count, idx| return array[idx] if count.odd? }
end



#Second attempt
=begin

PROBLEM: Take an array of integers and return the one integer that appears
an odd number of times
-Input: Array of integers (only one integer appears odd number of times)
-Ouput: The integer that appears odd number of times
-Rules:
-Return integer if array is only one element

EXAMPLES:
find_it([20,1,-1,2,-2,3,3,5,5,1,2,4,20,4,-1,-2,5]) == 5
find_it([1,1,2,-2,5,2,4,4,-1,-2,5]) == -1
find_it([20,1,1,2,2,3,3,5,5,4,20,4,5]) == 5
find_it([10]) == 10
find_it([1,1,1,1,1,1,10,1,1,1,1]) == 10

THOUGHTS:
WHAT DO WE WANT TO CHECK IN THIS PROBLEM?
Check each unique value in array and see if it appears an odd number of times

WITH THE ABOVE IN MIND, WHAT SHOULD WE ITERATE OVER AND WHAT DO WE NEED
ON EACH ITERATION?
Iterate over an array of unique integers and count how many times each unique
integer appears in original array

WHAT OTHER INFO DO WE NEED? HOW DO WE GO ABOUT GETTING IT?

DATA STRUCTURE:
Arrays(to hold original elements and unique elements)

ALGORITHM:
-Iterate over each unique value in array
  -Count the number of occurances of each unique element in original array
  -Return current integer if count is odd

=end

def find_it(array)
  array.uniq.each { |int| return int if array.count(int).odd? }
end

p find_it([20,1,-1,2,-2,3,3,5,5,1,2,4,20,4,-1,-2,5]) == 5
p find_it([1,1,2,-2,5,2,4,4,-1,-2,5]) == -1
p find_it([20,1,1,2,2,3,3,5,5,4,20,4,5]) == 5
p find_it([10]) == 10
p find_it([1,1,1,1,1,1,10,1,1,1,1]) == 10
