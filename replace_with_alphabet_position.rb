=begin
In this kata you are required to, given a string, replace every letter with its position 
in the alphabet. If anything in the text isn't a letter, ignore it and don't return it.
"a" = 1, "b" = 2, etc.
Example
alphabet_position("The sunset sets at twelve o' clock.")
Should return "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11" (as a string)
p alphabet_position("The sunset sets at twelve o' clock.") == "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5
15 3 12 15 3 11"
p alphabet_position("-.-'") == ""

PROBLEM: Take a string and replace each character with it's position in the alphabet. If characters
aren't letters, ignore them
-Input: String of characters
-Output: String of integers with characters deleted or replaced by place in the alphabet
-Rules:
-Ignore non-alphabeticals

EXAMPLES:
alphabet_position("The sunset sets at twelve o' clock.") == "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11" (as a string)
p alphabet_position("The sunset sets at twelve o' clock.") == "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5
15 3 12 15 3 11"
p alphabet_position("-.-'") == ""

THOUGHTS:
-Hash for conversion
-Transform every letter and delete nil values

DATA STRUCTURES:
Hash(for data conversion)

ALGORITHM:
-Convert string to all lowercase
-Create arrays of lowercase letters and integers
  -Zip them together and convert to hash

-Iterate over each character in string as array element
  -Transform with hash key as current character if included
-Delete nils from array
-Return as string joined with spaces 

=end

def alphabet_position(string)
  string = string.downcase
  conversion_hash = (('a'..'z').to_a).zip(('1'..'26').to_a).to_h

  string.chars.map do |char|
    conversion_hash[char] if conversion_hash.key?(char)
  end.compact.join(' ')
end

p alphabet_position("The sunset sets at twelve o' clock.") == "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11"
p alphabet_position("-.-'") == ""
