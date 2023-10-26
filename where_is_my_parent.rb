=begin
Mothers arranged a dance party for the children in school. At that party, 
there are only mothers and their children. All are having great fun on the 
dance floor when suddenly all the lights went out. 
It's a dark night and no one can see each other. But you were flying nearby 
and you can see in the dark and have ability to teleport people anywhere you want.
Legend:
-Uppercase letters stands for mothers, lowercase stand for their children, 
i.e. "A" mother's children are "aaaa".
-Function input: String contains only letters, uppercase letters are unique.
Task:
Place all people in alphabetical order where Mothers are followed by their children, 
i.e. "aAbaBb" => "AaaBbb"

p find_children("abBA") == "AaBb"
p find_children("AaaaaZazzz") == "AaaaaaZzzz"
p find_children("CbcBcbaA") == "AaBbbCcc"
p find_children("xXfuUuuF") == "FfUuuuXx"
p find_children("") == ""

PROBLEM: Order letters together based on the order of the alphabet, starting with uppercase
and then lowercase
-Input: String of upper and lower case letters
-Output: Characters ordered by alphabet with uppercase first
-Rules:
-Uppercase first, then equivlent lowercase
-Return empty string if input is empty

EXAMPLES:
p find_children("abBA") == "AaBb"
p find_children("AaaaaZazzz") == "AaaaaaZzzz"
p find_children("CbcBcbaA") == "AaBbbCcc"
p find_children("xXfuUuuF") == "FfUuuuXx"
p find_children("") == ""

THOUGHTS:
-Need a way to logically group letters (hash?)

DATA STRUCTURES:
-Hash(to group appearances of parent and instances of child)

ALGORITHM:
-Set chars_hash to empty hash
-Set output to empty string
-Iterate through each character in string as uppercase
  -If chars_hash has key of current character
    -Increment by 1
  -Else
    -Set chars_hash with key to 0
-Sort the hash by key and iterate through each key/value pair
  -Increment output by parent and instances of child
-Return output

=end

def find_children(string)
  chars_hash = {}
  string.upcase.each_char do |char|
    chars_hash.key?(char) ? chars_hash[char] += 1 : chars_hash[char] = 0
  end
  chars_hash.sort.map { |parent, child| parent + (parent.downcase * child) }.join
end

def find_children(string)
  string.upcase.chars.each_with_object({}) do |char, hash|
    hash.key?(char) ? hash[char] += 1 : hash[char] = 0
  end.sort.map { |parent, child| parent + (parent.downcase * child) }.join
end

def find_children(string)
  chars_array = string.downcase.chars.sort
  vals = chars_array.group_by { |letter| letter }.map { |k,v| [k * v.size] }
  vals.map { |arr| arr.join[0].upcase + arr.join[1..-1] }.join
end

#Alternate other student solution
#Demonstrates that transformation behavior isn't actually applied until new
#array is returned
def find_children(string)
  all_characters = string.downcase.chars.sort
  all_characters.map.with_index do |char, idx|
    char != all_characters[idx - 1] ? char.upcase : char
  end.join
end

#Alternate other student solution with sorting relative to a created array for precedence
def find_children(string)
  mothers_and_children = ('A'..'Z').zip(('a'..'z')).flatten
  string.chars.sort_by do |char|
    mothers_and_children.index(char)
  end.join
end

p find_children("abBA") == "AaBb"
p find_children("AaaaaZazzz") == "AaaaaaZzzz"
p find_children("CbcBcbaA") == "AaBbbCcc"
p find_children("xXfuUuuF") == "FfUuuuXx"
p find_children("") == ""
