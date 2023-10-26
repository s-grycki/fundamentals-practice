=begin
Not to brag, but I recently became the nexus of the Codewars universe! 
My honor and my rank were the same number. I cried a little.

Complete the method that takes a hash/object/directory/association list of users, 
and find the nexus: the user whose rank is the closest is equal to his honor. 
Return the rank of this user. For each user, the key is the rank and the value is the honor.

If nobody has an exact rank/honor match, return the rank of the user who comes closest. 
If there are several users who come closest, return the one with the lowest rank (numeric value). 
The hash will not necessarily contain consecutive rank numbers; return the best match from 
the ranks provided.

Example
rank honor
users = { 1 => 93,
10 => 55,
15 => 30,
20 => 19, <--- nexus
23 => 11,
30 => 2 }

PROBLEM:
Take a hash of users - key is rank and value is honor(Input)
Return rank of user where rank is closest to honor(Output)
Nexus: User whose rank is closest to honor
If nobody has exact match, return rank closest to honor (Explicit Rule)
If there are multiple closest, return the one with the lowest rank(Explicit Rule)
Hash may not have consectuve rank numbers(Explicit Rule)

Basically, this problem is just asking for the absolute value difference between
key/value pairs and returning the key with the lowest difference

EXAMPLES:
{1 => 3, 3 => 3, 5 => 1} => (1 - 3)abs == 2, (3 - 3) == 0, (5 - 1) == 4 => 3(key from 2nd key/value pair)
{1 => 10, 2 => 6, 3 => 4, 5 => 1} => (1 - 10) == 9, 2 - 6 == 4, 3 - 4 == 1, 5 - 1 == 4 => 3
{1 => 10, 2 => 3, 3 => 4, 5 => 1} => 9, 1, 1, 4 *2 key/values pairs with equal difference
=> 2 (Return lowest value key if multiple keys/values have same difference)

DATA STRUCTURES:
Input: Hash with integers as keys and values
Intermediate: Nested array with groups of 2 / Integer that gets overwritten with differences
Output: Key with lowest key/value difference (smallest key if multiple have same difference)
Helper: Nested array of keys/values

THOUGHTS:

ALGORITHM:
First pass:
Create nested array of key value pairs
Sort nested array by first value in accending order
Get min out of nested array by difference of 2 elements
Return first element

Second pass:
Set pairs_arr to convesion input to nested array [[1, 3], [3, 3], [5, 1]]
Sort by accending order according to first value [[1, 3], [3, 3], [5, 1]]
Get min subarray out of pairs_arr by absolute value difference (3 - 3) == 0 [3,3]
Return first value from subarray (output)

=end

def nexus(hash)
  pairs_arr = hash.to_a.sort_by { |subarr| subarr.first }
  pairs_arr.min_by { |a,b| (a-b).abs }.first
end

# Sort_by will already return a new array
def nexus(hash)
  hash.sort_by { |subarr| subarr.first }.min_by { |a,b| (a-b).abs }.first
end

p nexus({1 => 3, 3 => 3, 5 => 1}) == 3
p nexus({1 => 10, 2 => 6, 3 => 4, 5 => 1}) == 3
p nexus({1 => 10, 2 => 3, 3 => 4, 5 => 1}) == 2
