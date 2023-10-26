=begin
PROBLEM: Take an array of integers and an expected sum integer and return the
first 2 values that add up to sum. If there are more than 1 match, then use
the second index with lowest index value
-Input: Array of integers and a single expected sum value
-Output: The first 2 integers that add to sum or nil
-Rules:
-Return nil if sum can't be reached
-Negatives and duplicates will appear
-If there are multiple matches then use the second index with lowest index value

EXAMPLES:
sum_pairs([1, 4, 8, 7, 3, 15], 8) == [1, 7]
sum_pairs([1, -2, 3, 0, -6, 1], -6) == [0, -6]
sum_pairs([20, -13, 40], -7) == nil
sum_pairs([1, 2, 3, 4, 1, 0], 2) == [1, 1]
sum_pairs([10, 5, 2, 3, 7, 5], 10) == [3, 7]
sum_pairs([4, -2, 3, 3, 4], 8) == [4, 4]
sum_pairs([0, 2, 0], 0) == [0, 0]
sum_pairs([5, 9, 13, -3], 10) == [13, -3]

THOUGHTS:
-Need a way to capture matched values at indexes
  -Nested array of values where smallest second element is the answer
  -Compare indexes to input array to find our integers
-Iterate over every array element

DATA STRUCTURE:
Nested array (to contain all possible sum pairs), Array(to iterate values)

ALGORITHM:
-Set matched_indexes to empty array
-From 0 upto 1 minus length of array with outer_idx
  -From outer_idx plus 1 upto 1 minus length of array with inner_idx
    -If array at outer_idx + array at inner_idx equals to sum
      -Push outer_idx AND inner_idx onto matched_indexes inside array
-Sort matched_indexes by lowest final value and return this as seperate array
-Return array values that match with both indexes inside array


=end

def sum_pairs(array, sum)
  matched_indexes = []
  0.upto(array.size - 1) do |outer_idx|
    (outer_idx + 1).upto(array.size - 1) do |inner_idx|
      if array[outer_idx] + array[inner_idx] == sum
        matched_indexes << [outer_idx, inner_idx]
      end
    end
  end
  matched_indexes

  ans = matched_indexes.min_by { |arr| arr.last }
  return nil if ans.nil?
  [array[ans.first], array[ans.last]]
end

# If we tried to push the array values onto matched_indexes then we would have
# to find the lowest pair relative to their indexes from the original array.
# Since values repeat, the array#index method wouldn't always bind to the
# correct integer

p sum_pairs([1, 4, 8, 7, 3, 15], 8) #== [1, 7]
p sum_pairs([1, -2, 3, 0, -6, 1], -6) #== [0, -6]
p sum_pairs([20, -13, 40], -7) #== nil
p sum_pairs([1, 2, 3, 4, 1, 0], 2) #== [1, 1]
p sum_pairs([10, 5, 2, 3, 7, 5], 10) #== [3, 7]
p sum_pairs([4, -2, 3, 3, 4], 8) #== [4, 4]
p sum_pairs([0, 2, 0], 0) #== [0, 0]
p sum_pairs([5, 9, 13, -3], 10) #== [13, -3]








# FURTHER EXPLORATION WITH OPTIMIZATION

# Store each integer into a hash
  # This is to check if it already exists on each iteration of integer
  # Why does it matter if a previous number is stored?
    # If the difference between the sum and a previous integer plus the
    # Current integer integer equals target, then it's a valid match
    # Think about first example. When we get to 7, It matches that 1 and
    # 7 sum together for 8, but if we were to keep going, it wouldn't match
    # that 4 and 7 or 8 and 7 equal target sum


def sum_pairs(array, sum)
  hash = {}
  array.each do |int|
    return [(sum - int), int] if hash.key?(sum - int)
    hash[int] = int
  end
  nil 
end

p sum_pairs([1, 4, 8, 7, 3, 15], 8) == [1, 7]
p sum_pairs([1, -2, 3, 0, -6, 1], -6) == [0, -6]
p sum_pairs([20, -13, 40], -7) == nil
p sum_pairs([1, 2, 3, 4, 1, 0], 2) == [1, 1]
p sum_pairs([10, 5, 2, 3, 7, 5], 10) == [3, 7]
p sum_pairs([4, -2, 3, 3, 4], 8) == [4, 4]
p sum_pairs([0, 2, 0], 0) == [0, 0]
p sum_pairs([5, 9, 13, -3], 10) == [13, -3]

# On the first iteration, hash will be set to 10 since there is nothing to
# check yet. On the second iteration, 5 and 10 do not equate to the target,
# which is represented by checking if the hash has the key of sum - int (5).
# This value hasn't appeared yet, so the iteration continues and 5 is set to
# the hash. On 2, we want to know if any of the previous numbers sum with it
# to equal target. Our check shows that this number doesn't exist, so we
# continue. 3 doesn't sum with any of the previous values to target, so we
# assign this to the hash and continue. On 7, one of the previous values (3)
# will sum with it to equal the target. This is reflected in our check for a
# key of the target minus the current integer (7 + x = 10). 10 - 7 (or target
# minus current integer). Therefore, we return this previous value with the
# current integer in an array. The good thing about this solution, is that it
# will always choose the smallest second index since it's checking from left
# to right only once. This is far more optimized than the nested iterator
# logic where we get multiple returns and have to apply this back to the
# original array



# Could I use an array instead? Why a hash?
# The hash approach would collapse duplicate previous integers into a single
# grouping. With an array, we're still iterating over EVERY previous integer.
# I see an array being valueable when we want to preserve the index order of
# previous entries. Otherwise, I think a hash is more optimized

def sum_pairs(array, sum)
  int_array = []
  array.each do |int|
    return [(sum - int), int] if int_array.include?(sum - int)
    int_array << int
  end
  nil
end

p sum_pairs([1, 4, 8, 7, 3, 15], 8) == [1, 7]
p sum_pairs([1, -2, 3, 0, -6, 1], -6) == [0, -6]
p sum_pairs([20, -13, 40], -7) == nil
p sum_pairs([1, 2, 3, 4, 1, 0], 2) == [1, 1]
p sum_pairs([10, 5, 2, 3, 7, 5], 10) == [3, 7]
p sum_pairs([4, -2, 3, 3, 4], 8) == [4, 4]
p sum_pairs([0, 2, 0], 0) == [0, 0]
p sum_pairs([5, 9, 13, -3], 10) == [13, -3]


# How do I know if I'm able to use this approach or the nested iterator approach?
# Logically, this is good for problems where want to compare the current value
# with previous values, since we're storing them in a container. It's perfect for
# a problem like this, since we want the lowest second index possible - which is
# represented by the current number we're checking against the stored values

