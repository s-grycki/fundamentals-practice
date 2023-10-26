=begin
You probably know the "like" system from Facebook and other pages. People can "like" 
blog posts, pictures or other items. We want to create the text that should be 
displayed next to such an item. Implement a function likes :: [String] -> String, 
which must take in input array, containing the names of people who like an item. 
It must return the display text as shown in the examples:

PROBLEM:
Take an array of name strings(input)
Return a string using the names from input(output)

Implicit Rule:
Return no one likes this if input is empty
All elements will be valid name strings
If 2 elements, seperate names with 'and' (Jacob and Alex)
If 3 elements, seperate first and second with comma. Second and third with 'and' 
(Max, John and Mark)
If 4 or more elements, seperate first and second with comma. Second and others with 'and' 
(Alex, Jacob and 2 others)

EXAMPLES:

DATA STRUCTURES:
Input: Array of string elements
Intermediate: Array where we're inserting new elements
Output: String with array elements interpolated/concatenated

THOUGHTS:
Need to get subarray with 4 or more case [0..3] (since inserted 2 elements)
Need array size minus 4 since 2 elements are inserted with 4 or more

ALGORITHM:
Get size of the array
If size is 0 ([])
  Return "no one likes this"
If size is 1 ["Peter"]
  Return (name) likes this (name == only array element)
If size is 2 ["Jacob", "Alex"]
  Return (name1) and (name2) like this ["Jacob", "and", "Alex"] => format rest of string
If size is 3 ["Max", "John", "Mark"]
  Return (name1), (name2) and (name3) like this ["Max", "," "John", "and", "Mark"]
If size is greater than 3 ["Alex", "Jacob", "Mark", "Max"]
  Return (name1), (name2) and (array size minus 2) like this ["Alex", "," "Jacob", "and", ("Mark", "Max"])
["Alex", "," "Jacob", "and"] *first 4 array elements + array size minus 2
=end

def likes(array)
  case array.size
  when 0 then "no one likes this"
  when 1 then "#{array.first} likes this"
  when 2 then "#{array.insert(1,' and ').join}" + ' like this'
  when 3 then "#{array.insert(1,', ').insert(3, ' and ').join}" + ' like this'
  when (4..)
    "#{array.insert(1,', ').insert(3, ' and ')[0..3].join}#{array.size - 4} others like this"
  end
end

# Refactored solution. Didn't need to insert elements because string interpolation
# gives enough flexibility to retrieve specific array elements inside a set string
def likes(array)
  case array.size
  when 0 then "no one likes this"
  when 1 then "#{array.first} likes this"
  when 2 then "#{array[0]} and #{array[1]} like this"
  when 3 then "#{array[0]}, #{array[1]} and #{array[2]} like this"
  when (4..) then "#{array[0]}, #{array[1]} and #{array.size - 2} others like this"
  end
end

p likes([]) == "no one likes this"
p likes(["Peter"]) == "Peter likes this"
p likes(["Jacob", "Alex"]) == "Jacob and Alex like this"
p likes(["Max", "John", "Mark"]) == "Max, John and Mark like this"
p likes(["Alex", "Jacob", "Mark", "Max"]) == "Alex, Jacob and 2 others like this"
