=begin
Given a word, create a hash which stores the indexes of each letter in an array.
Make sure the letters are the keys.
Make sure the letters are symbols.
Make sure the indexes are stored in an array and those arrays are values.

p map_letters("froggy") == { :f => [0], :r=>[1], :o=>[2], :g=>[3, 4], :y=>[5] }
p map_letters("dodo") == { :d=>[0, 2], :o=>[1, 3] }
p map_letters("grapes") == { :g=>[0], :r=>[1], :a=>[2], :p=>[3], :e=>[4], :s=>[5] }


PROBLEM:
Take a word as a string(input)
Return a hash with index of each letter in an array(output)

Explicit Rules:
Make sure the letters are the keys.
Make sure the letters are symbols.
Make sure the indexes are stored in an array and those arrays are values.

Implicit Rule:
Do not overwrite duplicate key/value pairs
Input will be lowercase

EXAMPLES:
"froggy" => 'f' => [0], 'r' => [1], 'o' => [2], 'g' => [3, 4], 'y' => [5]

DATA STRUCTURES:
Input: String of lowercase letters
Intermediate: Array (to handle indexes on iteration)
Output: Hash with symbol keys and associated index values in an array

THOUGHTS:


ALGORITHM:
Iterate over each character with an index
Set key/value pair if it's not already found
Else push associated index onto appropriate key/value pair
Transform all keys into symbols

Set indexes_hash to new hash
Iterate over each character in an array with an index [f,r,o,g,g,y] (0)
  Convert current letter to symbol (:f)
  If indexes_hash has key of current letter as symbol (:g)
    Push index onto key/value pair :g => [3] << 4
  Else
    Create new key/value pair in indexes_hash with symbol key and index in array :f => [0]
Return indexes_hash

=end

def map_letters(string)
  indexes_hash = {}

  string.chars.each_with_index do |char, idx|
    char = char.to_sym
    if indexes_hash.key?(char)
      indexes_hash[char] << idx
    else
      indexes_hash[char] = [idx]
    end
  end

  indexes_hash
end

p map_letters("froggy") == { :f => [0], :r=>[1], :o=>[2], :g=>[3, 4], :y=>[5] }
p map_letters("dodo") == { :d=>[0, 2], :o=>[1, 3] }
p map_letters("grapes") == { :g=>[0], :r=>[1], :a=>[2], :p=>[3], :e=>[4], :s=>[5] }
