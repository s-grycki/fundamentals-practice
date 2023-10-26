=begin
Write a method that takes a string as an argument and groups the number of times 
each character appears in the string as a hash sorted by the highest number of occurrences.
The characters should be sorted alphabetically e.g:
get_char_count("cba") => {1=>["a", "b", "c"]}
You should ignore spaces, special characters and count uppercase letters as lowercase ones.

PROBLEM:
Take a string of characters(input)
Return a hash with an occurance of each character as an integer key and
the characters that appear that many times as an array for values(output)

Sort characters alphabetically(Explicit Rule)
Ignore spaces and special characters(Explicit Rule)
count uppercase letters as lowercase ones(Explicit Rule)
Special characters: Non-alphanumerics(Implicit Rule)

EXAMPLES:
("Mississippi") == {4=>["i", "s"], 2=>["p"], 1=>["m"]}
Count of of i and s is 4(key), (element values in array)

DATA STRUCTURES:
Input: String of characters
Intermediate: Array(character grouping)
Output: Hash with count keys and character values

THOUGHTS:
Alphabetical order in teh context of this problem seems to imply
highest value keys first and then sort the characters in each array

ALGORITHM:
Delete non-alphanumerics from input and set to all downcase "hellohellohello"
Group all characters in the string by their counts {3=>["h", "e", "o", "h", "e", "o", "h", "e", "o"], 6=>["l", "l", "l", "l", "l", "l"]}
Select only unique values in the value arrays {3=>["h", "e", "o"], 6=>["l"]}
Sort each key in hash in decending order { 6=>["l"], 3=>["h", "e", "o"] }
Sort the characters in each value {6=>["l"], 3=>["e", "h", "o"]}

=end

def get_char_count(string)
  string = string.downcase.delete('^0-9a-z')
  hsh = string.chars.group_by { |char| string.count(char) }.transform_values(&:uniq)
  hsh = hsh.sort { |a,b| b <=> a }.to_h
  hsh.transform_values(&:sort)
end

p get_char_count("Mississippi") == {4=>["i", "s"], 2=>["p"], 1=>["m"]}
p get_char_count("Hello. Hello? HELLO!!") == {6=>["l"], 3=>["e", "h", "o"]}
p get_char_count("aaa...bb...c!") == {3=>["a"], 2=>["b"], 1=>["c"]}
p get_char_count("aaabbbccc") == {3=>["a", "b", "c"]}
p get_char_count("abc123") == {1=>["1", "2", "3", "a", "b", "c"]}
