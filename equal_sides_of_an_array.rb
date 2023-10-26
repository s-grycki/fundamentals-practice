=begin
PROBLEM: Take an array of integers and find an index where the sum of integers
to the left of n is equal to sum to the right. -1 if not possible. Pick first
index if more cases are valid
-Input: Array of integers
-Output: First index where left of array equals right
-Rules:
-Pick first index if more than one valid
-Disregard value of current index with left/right calculations
-Left of first index or right of last index counts as empty array (zero value)
- -1 if it can never happen

EXAMPLES:
find_even_index([1,2,3,4,3,2,1]) == 3
find_even_index([1,100,50,-51,1,1]) == 1
find_even_index([1,2,3,4,5,6]) == -1
find_even_index([20,10,30,10,10,15,35]) == 3
find_even_index([20,10,-80,10,10,15,35]) == 0
find_even_index([10,-80,10,10,15,35,20]) == 6
find_even_index(Array(1..100)) == -1
find_even_index([0,0,0,0,0]) == 0
find_even_index([-1,-2,-3,-4,-3,-2,-1]) == 3
find_even_index(Array(-100..-1)) == -1

THOUGHTS:
-Want to iterate over each integer in array
-The current element on each iteration should serve as deliminator between
left and right(how to best do this?)
-The left should be 0 on first iteration
-Could add elements onto sum of left for each iteration and compare this way

DATA STRUCUTRE:
-Array (to hold initial values)

ALGORITHM:
-Set left to 0
-Iterate over each number in array with index
  -Return index if left == sum of array elements from current index + 1 to end
  *want to exclude current index
  -Add array at current index to left
-Return -1


=end

def find_even_index(array)
  left = 0

  array.each_with_index do |int, idx|
    return idx if left == array[idx + 1..-1].sum
    left += int
  end

  -1
end 

p find_even_index([1,2,3,4,3,2,1]) == 3
p find_even_index([1,100,50,-51,1,1]) == 1
p find_even_index([1,2,3,4,5,6]) == -1
p find_even_index([20,10,30,10,10,15,35]) == 3
p find_even_index([20,10,-80,10,10,15,35]) == 0
p find_even_index([10,-80,10,10,15,35,20]) == 6
p find_even_index(Array(1..100)) == -1
p find_even_index([0,0,0,0,0]) == 0
p find_even_index([-1,-2,-3,-4,-3,-2,-1]) == 3
p find_even_index(Array(-100..-1)) == -1
