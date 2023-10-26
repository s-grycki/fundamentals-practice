=begin
You've just discovered a square (NxN) field and you notice a warning sign.
The sign states that there's a single bomb in the 2D grid-like field in front of you.

Write a function mineLocation/MineLocation that accepts a 2D array, and returns 
the location of the mine. The mine is represented as the integer 1 in the 2D array. 
Areas in the 2D array that are not the mine will be represented as 0s.
The location returned should be an array where the first element is the row index,
and the second element is the column index of the bomb location (both should be 0 based).
All 2D arrays passed into your function will be square (NxN), and there will only be one 
mine in the array.

p mineLocation( [ [1, 0, 0], [0, 0, 0], [0, 0, 0] ] ) == [0, 0]
p mineLocation( [ [0, 0, 0], [0, 1, 0], [0, 0, 0] ] ) == [1, 1]
p mineLocation( [ [0, 0, 0], [0, 0, 0], [0, 1, 0] ] ) == [2, 1]
p mineLocation([ [1, 0], [0, 0] ]) == [0, 0]
p mineLocation([ [1, 0, 0], [0, 0, 0], [0, 0, 0] ]) == [0, 0]
p mineLocation([ [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 1, 0], [0, 0, 0, 0] ]) == [2, 2]

PROBLEM: Take an array of array of 1s and 0s. Where the single 1 represents a mine.
Return an array of 2 integers, where the first represents the array of the 1, and
the second represents the index where it's located in the array
-Input: Array of arrays containing all 0s and one 1
-Output: Array representing the subarray of the 1 and the index
-Rules:
-The number of elements in each sub array will equal the number of sub arrays

EXAMPLES:
p mineLocation( [ [1, 0, 0], [0, 0, 0], [0, 0, 0] ] ) == [0, 0]
p mineLocation( [ [0, 0, 0], [0, 1, 0], [0, 0, 0] ] ) == [1, 1]
p mineLocation( [ [0, 0, 0], [0, 0, 0], [0, 1, 0] ] ) == [2, 1]
p mineLocation([ [1, 0], [0, 0] ]) == [0, 0]
p mineLocation([ [1, 0, 0], [0, 0, 0], [0, 0, 0] ]) == [0, 0]
p mineLocation([ [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 1, 0], [0, 0, 0, 0] ]) == [2, 2]

THOUGHTS:
-Need to find sub array containing a 1 and need to get an index from this subarray
-Double iteration logic to get a specific index from correct array
  -My thinking went here because of the nested data structure. We needed to
  iterate over each subarray so we could check the values. This was already
  being done within the block with method chaining onto the parameter. I
  think a better sub-process thought would have been to get the subarray
  with 1 in it, as opposed to thinking about the individual return values
  in the array

-Need way to scan each subarray for the integer 1

DATA STRUCUTRES:
-Array(for subarray checks and for output of correct subarray and index)

ALGORITHM:
-Set pairs_array to empty array
-Iterate over each subarray in array with index
  -Select the subarray which sums to 1
    -Push index of selected subarray relative to array onto pairs_array
    -Get index from subarray where 1 is located
    -Push index onto pairs_array
-Return pairs_array

=end

def mineLocation(array)
  pairs_array = []

  array.each_with_index do |subarr, idx|
    pairs_array << idx if subarr.sum == 1
  end

  array[pairs_array.first].each_with_index do |int, idx|
    pairs_array << idx if int == 1
  end

  pairs_array
end

#Refactored solution
def mineLocation(array)
  pairs_array = []
  mine_array = array.select { |subarr| subarr.include?(1) }.flatten
  pairs_array.push(array.index(mine_array), mine_array.index(1))
end


p mineLocation( [ [1, 0, 0], [0, 0, 0], [0, 0, 0] ] ) == [0, 0]
p mineLocation( [ [0, 0, 0], [0, 1, 0], [0, 0, 0] ] ) == [1, 1]
p mineLocation( [ [0, 0, 0], [0, 0, 0], [0, 1, 0] ] ) == [2, 1]
p mineLocation([ [1, 0], [0, 0] ]) == [0, 0]
p mineLocation([ [1, 0, 0], [0, 0, 0], [0, 0, 0] ]) == [0, 0]
p mineLocation([ [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 1, 0], [0, 0, 0, 0] ]) == [2, 2]
