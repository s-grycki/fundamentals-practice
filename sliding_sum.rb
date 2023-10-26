=begin
Create a function that returns the subarrays of n consecutive elements from the 
original element that sum up to k. The function will have the following form: 
`sliding_sum(arr, n, k)`.

Return an empty array if no subarrays satisfy the `(n,k)` condition.

PROBLEM: Take an array of integers and return subarrays which represent n number of elements that sum up to k
-Input: Array of integers, n which represents number of elemnents, and k as sum target
-Output: Subarrays with n number elements summing to k
-Rules:
-Return empty array if nothing sums to k

EXAMPLES:
p sliding_sum([1, 4, 2, 3, 5, 0], 2, 5) == [[1, 4], [2, 3], [5, 0]]
p sliding_sum([5, 5, 5, 5, 5], 1, 5) == [[5], [5], [5], [5], [5]]
p sliding_sum([5, 5, 5, 5, 5], 5, 24) == []

THOUGHTS:
-Split into subarrays with n number elements which sum up to k
-Iterate from 1 upto n to get elements to push

DATA STRUCTURE:
Arrays(to contain integers, and subarrays to seperate elements)

ALGORITHM:
-Set sums_array to an empty Array
-Set times to array size divided by n
-Set copy_array to copy of array

-Iterate n times
  -Delete n number of elements from front of copy_array (pairs)

  -Push pairs onto sums_array if pairs sums to k
-Return sums_array


=end

def sliding_sum(array, n, k)
  sums_array = []
  iterate = array.size / n
  copy_array = array.clone

  iterate.times do
    pairs = copy_array.shift(n)
    sums_array << pairs if pairs.sum == k
  end

  sums_array
end

p sliding_sum([1, 4, 2, 3, 5, 0], 2, 5) == [[1, 4], [2, 3], [5, 0]]
p sliding_sum([5, 5, 5, 5, 5], 1, 5) == [[5], [5], [5], [5], [5]]
p sliding_sum([5, 5, 5, 5, 5], 5, 24) == []
p sliding_sum([1, 2, 2, 2], 2, 4) == [[2, 2]]



#Alternate answer with each_slice
def sliding_sum(array, n, k)
  target_values = []
  array.each_slice(n) do |subarr|
    target_values << subarr if subarr.sum == k
  end
  target_values
end

p sliding_sum([1, 4, 2, 3, 5, 0], 2, 5) == [[1, 4], [2, 3], [5, 0]]
p sliding_sum([5, 5, 5, 5, 5], 1, 5) == [[5], [5], [5], [5], [5]]
p sliding_sum([5, 5, 5, 5, 5], 5, 24) == []
p sliding_sum([1, 2, 2, 2], 2, 4) == [[2, 2]]



#Alternate answer with each_cons if we want duplicate values in arrays
def sliding_sum(array, n, k)
  target_values = []
  array.each_cons(n) do |arr|
    target_values << arr if arr.sum == k
  end
  target_values
end

p sliding_sum([1, 4, 2, 3, 5, 0], 2, 5) == [[1, 4], [2, 3], [5, 0]]
p sliding_sum([5, 5, 5, 5, 5], 1, 5) == [[5], [5], [5], [5], [5]]
p sliding_sum([5, 5, 5, 5, 5], 5, 24) == []
p sliding_sum([1, 2, 2, 2], 2, 4) == [[2, 2], [2, 2]]




