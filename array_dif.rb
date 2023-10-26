=begin
Your goal in this kata is to implement a difference function, which subtracts one 
list from another and returns the result.
It should remove all values from list a, which are present in list b.
array_diff([1,2],[1]) == [2]
If a value is present in b, all of its occurrences must be removed from the other:
array_diff([1,2],[1]) == [2]

PROBLEM:
array1 and array2(input)
array1(output)

Take values from array 1 and remove the ones present in array 2
Remove all occurances from array 2


EXAMPLES:
[1,2], [1] => 1 is in both. Delete from both. => [2]
[1,2,2], [1] => [2,2]
[1,2,2], [2] => 1 isn't in both, so keep. 2 is in both, so delete all occurances [1]
[1,2,2], [] => [1,2,2] *array 2 empty
[], [1,2] => [] *array 1 empty

DATA STRUCTURES:
Input: 2 arrays of integers
Intermediate: -
Output: array of integers (non-shared elements from array1)

THOUGHTS:
Method array#difference (best route)
*Algorithm shows more language agnostic approach

ALGORITHM:
Iterate over every integer in array 1 (1, 2)
  Check if current integer is included in array2 (1)
    Delete value from both arrays if it is [2], []
Return array1 with deleted values [2]

=end

def array_diff(arr1, arr2)
  arr1.difference(arr2)
end

p array_diff([1,2], [1]) == [2]
p array_diff([1,2,2], [1]) == [2,2]
p array_diff([1,2,2], [2]) == [1]
p array_diff([1,2,2], []) == [1,2,2]
p array_diff([], [1,2]) == []
