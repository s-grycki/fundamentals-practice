=begin
Given a string that includes alphanumeric characters ("3a4B2d") return the 
expansion of that string: The numeric values represent the occurrence of 
each letter preceding that numeric value. 
There should be no numeric characters in the final string.

Notes
  The first occurrence of a numeric value should be the number of times 
  each character behind it is repeated, until the next numeric value appears
  If there are multiple consecutive numeric characters, only the last one 
  should be used (ignore the previous ones)
  Empty strings should return an empty string.

Your code should be able to work for both lower and capital case letters.



PROBLEM: Take a string of integers and alphabetics. Expand the alphabetics
out based on the preceeding integer and return a string with only alphabetics
Rules:
-If there are multiple characters following an integer, multiply each by the integer
-If there are multiple integers before a character, only use the last integer
-If there are no integers, return the string
-If there are are alphabetics, return empty string
-If input is empty, return an empty string

EXAMPLES:
expand_string("3D2a5d2f") ==  "DDDaadddddff"
expand_string("3abc") == "aaabbbccc"
expand_string("3d332f2a") == "dddffaa"
expand_string("abcde") == "abcde"
expand_string("1111") == ""
expand_string("") == ""

THOUGHTS:
-Don't reassign previous integer until current character was an integer
-If current character is an integer
  -reassign previous integer (do nothing else)
-If current character is an alphabetic
  -Multiply current character by previous integer

-Return input if there a no integers included
-Return empty string if no alphabetics or input is empty

DATA STRUCTURES:
Array?

ALGORITHM:
-Set previous_int to 0
-Set output to empty string

-Iterate over each character in input string
  -Return input if all characters to string to integer == 0

-Iterate over each character in input string
  -Return empty if input is empty OR all current character to string to integer == self

-Iterate over each character in input string
  -If current character is an integer (current character to string to integer == self)
    -Reassign previous_int to current character
  -If current character is alphabetic Array((a..z + A..Z)).include?(current character)
    -output = output + (current character * previous_int)
-Return output 

=end

def expand_string(string)
  previous_int = 0
  output = ''
  valid_letters = ('a'..'z').to_a + ('A'..'Z').to_a

  return string if string.chars.all? { |char| char.to_i.to_s == '0' }
  return output if string.chars.all? { |char| char.to_i.to_s == char }

  string.each_char do |char|
    if char.to_i.to_s == char
      previous_int = char.to_i
    elsif valid_letters.include?(char)
      output = output + (char * previous_int)
    end
  end

  output
end

# Alternate solution
def expand_string(string)
  output = ''
  previous_int = 1

  string.each_char do |char|
    if char.to_i.to_s == char
      previous_int = char.to_i
    else
      output << char * previous_int
    end
  end
  
  output
end

p expand_string("3D2a5d2f") ==  "DDDaadddddff"
p expand_string("3abc") == "aaabbbccc"
p expand_string("3d332f2a") == "dddffaa"
p expand_string("abcde") == "abcde"
p expand_string("1111") == ""
p expand_string("") == ""
