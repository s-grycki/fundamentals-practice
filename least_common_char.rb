=begin
# Write a method that takes a string as an argument and returns
# the character that occurs least often in the given string.
# If there are multiple characters with the equal lowest number
# of occurrences, then return the one that appears first in the
# string. When counting characters, consider the uppercase and
# lowercase version to be the same.

# Examples:

p least_common_char("Hello World") #== "h"
p least_common_char("Peter Piper picked a peck of pickled peppers") #== "t"
p least_common_char("Mississippi") #== "m"
p least_common_char("Happy birthday!") #== ' '
p least_common_char("aaaaaAAAA") #== 'a'

# The tests above should print "true".

PROBLEM: Take a string and return the character with the lowest count value.
If multiple characters have the same count value, return the one which
appears first. Disregard letter case
-Input: String of characters
-Output: The lowest counting character that appears first (as lowercase)
-Rules:
-Return as lowercase regardless of how it appears in string
-Return self if only one character

EXAMPLES:
p least_common_char("Hello World") #== "h"
p least_common_char("Peter Piper picked a peck of pickled peppers") #== "t"
p least_common_char("Mississippi") #== "m"
p least_common_char("Happy birthday!") #== ' '
p least_common_char("aaaaaAAAA") #== 'a'

THOUGHTS:
-Iterate over each character in string to check for lowest counting character
-Store previously iterated lowest value
-Need a way to store current lowest occuring character and replace ONLY if
next checked is lower

DATA STRUCUTRES:


ALGORITHM:
-Set lowest_count to string size + 1
-Set lowest_char to ''
-Set uniq_chars to array of all unique characters from array

-Iterate over each character in uniq_chars
  -Count the occurances of each unique character in string
  -If current count < lowest_count
    -Set lowest_count to current_count
    -Set lowest_char to current_char

    -Return current_char
=end

def least_common_char(string)
  string = string.downcase
  lowest_count = string.size + 1
  lowest_char = ''

  string.chars.uniq.each do |char|
    if string.count(char) < lowest_count
      lowest_count = string.count(char)
      lowest_char = char
    end
  end

  lowest_char
end


p least_common_char("Hello World") == "h"
p least_common_char("Peter Piper picked a peck of pickled peppers") == "t"
p least_common_char("Mississippi") == "m"
p least_common_char("Happy birthday!") == ' '
p least_common_char("aaaaaAAAA") == 'a'



#Second attempt
=begin
# Write a method that takes a string as an argument and returns
# the character that occurs least often in the given string.
# If there are multiple characters with the equal lowest number
# of occurrences, then return the one that appears first in the
# string. When counting characters, consider the uppercase and
# lowercase version to be the same.

# Examples:

p least_common_char("Hello World") #== "h"
p least_common_char("Peter Piper picked a peck of pickled peppers") #== "t"
p least_common_char("Mississippi") #== "m"
p least_common_char("Happy birthday!") #== ' '
p least_common_char("aaaaaAAAA") #== 'a'

# The tests above should print "true".

PROBLEM: Take a string of characters and return the character that appears the
least often. Only overwrite least counted character if future character has fewer
occurances
Input: String of characters
Output: The least occuring character first appearing as a lowercase equivalent
Rules:
-Always return lowercase (disregard case)
-If a character is all the string, return character lowercased
  -Otherwise, return first character to count 1

EXAMPLES:
p least_common_char("Hello World") #== "h"
p least_common_char("Peter Piper picked a peck of pickled peppers") #== "t"
p least_common_char("Mississippi") #== "m"
p least_common_char("Happy birthday!") #== ' '
p least_common_char("aaaaaAAAA") #== 'a'

THOUGHTS:
-If string is all same character, return character
  -Count unique occurances relative to input
-Iterate over each unique character occurance and count occurances from 1st string

DATA STRUCUTRE:
Array?

ALGORITHM:
-Set string to all lowercase
-Return first character if all characters are the same
-Iterate over each unique character in string with a hash
  -Set hash to key of character with count of character in string
-Get the minimum key from hash by value

=end

def least_common_char(string)
  string = string.downcase

  count_hash = string.chars.uniq.each_with_object({}) do |char, hash|
    hash[char] = string.count(char)
  end

  count_hash.min_by { |letter, count| count }.first
end

#One-liner
def least_common_char(string)
  string.downcase.chars.tally.min_by { |_,v| v }.first
end

p least_common_char("Hello World") == "h"
p least_common_char("Peter Piper picked a peck of pickled peppers") == "t"
p least_common_char("Mississippi") == "m"
p least_common_char("Happy birthday!") == ' '
p least_common_char("aaaaaAAAA") == 'a'
p least_common_char("aaaBBcCc") == 'b'
