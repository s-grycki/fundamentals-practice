=begin
PROBLEM: Find the greatest product of 5 consecutive digits from a string input
of integers
-Input: String of digits
-Greatest product of 5 consecutive integers
-Rules:
-Assume all inputs will have more than 5 digits

EXAMPLES:
greatest_product("123834539327238239583") == 3240
greatest_product("395831238345393272382") == 3240
greatest_product("92494737828244222221111111532909999") == 5292
greatest_product("92494737828244222221111111532909999") == 5292
greatest_product("02494037820244202221011110532909999") == 0

THOUGHTS:
-Want to iterate over each character in string
-Want to convert to a digit on an individual basis (nested array with inner array as elements)
-On outer iteration won't need to go past 5 minus string length
-Inner iteration start at outer index plus 4

-I ignored that all array elements have to be EXACTLY 5 elements
-We only need one set of substrings per iteration (5 elements). A nested looping
structure isn't necessary to solve this problem like if we wanted ALL
(or at least multiple) possible substrings

DATA STRUCTURE:
Nested array(to contain every valid substring as individual integer elements)

ALGORITHM:
GET ALL VALID SUBSTRINGS
-Set integers_array to empty array
-Iterate from 0 to string length minus 5 with outer_idx
  -Iterate from outer_index plus 4 to string length minus 1 with inner_idx
    -Push string from outer_idx..inner_idx onto integers_array as individual
    elements in their own array

GET MAXIMUM PRODUCT
-Iterate over each array of integers in integers_array
  -Multiply all together as integers
-Return maximum value

=end



=begin #Shows unneeded nested iteration. We only need exactly 5 chars each time
def get_substrings(string)
  integers_array = []
  0.upto(string.size - 5) do |outer_idx|
    (outer_idx + 4).upto(string.size - 1) do |inner_idx|
      integers_array << [string[outer_idx..inner_idx]]
      break if inner_idx - outer_idx >= 4
    end
  end
  integers_array.map { |arr| arr.join.chars }
end
=end



def greatest_product(string)
  integers_array = get_substrings(string)
  get_maximum(integers_array)
end

def get_substrings(string)
  integers_array = []
  0.upto(string.size - 5) do |outer_idx|
    integers_array << [string[outer_idx..outer_idx + 4]]
  end
  integers_array.map { |arr| arr.join.chars }
end

def get_maximum(integers_array)
  integers_array.map do |arr|
    arr.map { |elem| elem.to_i }.inject(:*)
  end.max
end



#Alternate solution
def greatest_product(string)
  product_array = []
  0.upto(string.size - 5) do |index|
    product_array << string[index..index + 4].chars.map(&:to_i).inject(:*)
  end
  
  product_array.max
end


p greatest_product("123834539327238239583") == 3240
p greatest_product("395831238345393272382") == 3240
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("02494037820244202221011110532909999") == 0






#Second attempt
=begin
Find the greatest product of 5 consecutive digits from a string input
of integers

greatest_product("123834539327238239583") == 3240
greatest_product("395831238345393272382") == 3240
greatest_product("92494737828244222221111111532909999") == 5292
greatest_product("92494737828244222221111111532909999") == 5292
greatest_product("02494037820244202221011110532909999") == 0

PROBLEM: Find the greatest product of 5 consecutive digits from a
string input of integers
-Input: String of digits
-Output: Greatest sum from 5 consecutive integers
-Rules:
-

EXAMPLES:
greatest_product("123834539327238239583") == 3240
greatest_product("395831238345393272382") == 3240
greatest_product("92494737828244222221111111532909999") == 5292
greatest_product("92494737828244222221111111532909999") == 5292
greatest_product("02494037820244202221011110532909999") == 0

THOUGHTS:
-Logical groupings of 5
-Need to convert to integers before multiplying
-Need to get max value
  -Use counter to check for greatest product

DATA STRUCTURES:
Array(for type conversions and incrementing groups)

ALGORITHM:
-Set current_max to 0
-Iterate over every character as an integer in array
  -Group according to consecutive 5s
  -If product of group is greater than current_max
    -Set group to current max
-Return current_max

=end

def greatest_product(string)
  current_max = 0
  string.chars.map(&:to_i).each_cons(5) do |arr|
    current_max = arr.inject(:*) if arr.inject(:*) > current_max
  end
  current_max
end


p greatest_product("123834539327238239583") == 3240
p greatest_product("395831238345393272382") == 3240
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("02494037820244202221011110532909999") == 0
