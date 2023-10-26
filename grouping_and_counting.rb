=begin
PROBLEM: Take an array and return a hash. The returned hash should contain
as keys the unique array values with the count of each as value. Return
nil if hash if empty or nil (if array if empty or has only ALL nil value)
-Input: Array of unique values
-Output: Hash with count of unique values
-Rules:
-Count each array value as unique key
-Don't use Array#count or Array#length
-What's an example of nil input? I don't see this in the test cases

EXAMPLES:
group_and_count([0,1,1,0]) == {0=>2, 1=>2}

THOUGHTS:
-Guard clause to return nil if input is empty or contains only nil
-Iterate over every number in array
-Use hash keys to capture unique values

DATA STRUCTURES:
Array (for hash keys), Hash (to count all occurances of an element)

ALGORITHM:
-Return nil if array is empty or contains ALL nil
-Iterate over every number in array with new hash object
  -If hash has key of current number
    -Increment this key value by 1
  -Else
    -Set key to current number with 1 as value

=end

def group_and_count(array)
  return nil if array.empty? || array.all?(nil)
  array.each_with_object({}) do |num, hash|
    if hash.key?(num)
      hash[num] += 1
    else
      hash[num] = 1
    end
  end
end


#Second attempt (more terse solution)
def group_and_count(array)
  return nil if array.empty? || array.all?(nil)
  array.uniq.each_with_object({}) do |int, hash|
    hash[int] = array.count(int)
  end
end

#Alternate solution with group_by
def group_and_count(array)
  return nil if array.empty? || array.all?(nil)
  array.group_by { |int| int }.map { |k,v| [k,v.size] }.to_h
end

#Alternate solution with tally
def group_and_count(array)
  return nil if array.empty? || array.all?(nil)
  array.tally
end

p group_and_count([0,1,1,0]) == {0=>2, 1=>2}
p group_and_count([1,1,2,2,2,3]) == {1=>2, 2=>3, 3=>1}
p group_and_count([]) == nil
p group_and_count([nil]) == nil
