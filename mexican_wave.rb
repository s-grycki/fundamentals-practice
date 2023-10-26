=begin
In this simple Kata your task is to create a function that turns a string 
into a Mexican Wave. You will be passed a string and you must return that 
string in an array where an uppercase letter is a person standing up
Rules
1. The input string will always be lower case but maybe empty.
2. If the character in the string is whitespace then pass over it as if 
it was an empty seat

PROBLEM: Take a string of lowercase letters and spaces and capitalize each
successive letter starting with the first. Skip over spaces as if they aren't
there, but maintain them in output where output is an array repeated for each
letter in string

THOUGHTS:
-Create new array with the string repeated as an element for the number of letters
-Iterate over the array with an index
  -If current index is whitespace skip
  -If current index is a letter
    -Capitalize current index in array

-
DATA STRUCTURE:
Array

ALGORITHM:
-Set counter to 0
-Delete non-letters from string and iterate over each character
  -Transform element to input on each iteration

-Iterate over each element in array with an index
  -If current character is a whitespace
    -Return self
  -If current character is a letter iterate over array of elements with an index
    -If counter == index
      -capitalize letter
      -counter += 1
    -Else character

=end





def wave(string)
  (0...string.size).map do |idx|
    if string[idx] == ' '
      nil
    else
      string[0...idx] + string[idx].upcase + string[idx + 1..-1]
    end
  end.compact
end





#Second attempt
=begin
In this simple Kata your task is to create a function that turns a string 
into a Mexican Wave. You will be passed a string and you must return that 
string in an array where an uppercase letter is a person standing up
Rules
1. The input string will always be lower case but maybe empty.
2. If the character in the string is whitespace then pass over it as if 
it was an empty seat

PROBLEM:
Take a string(input)
Return an array with character elements and each successive letter upcased (output)
String always lowercase or spaces(Explicit Rule)
Pass over spaces when considering upcase rules(Explicit Rule)
Return empty array if empty string input(Implicit Rule)
Spaces don't reflect number of elements that should be returned(Implicit Rule)

EXAMPLES:
(" gap ") => [" gap " * 5] => (' gap ', ' Gap ', ' gAp ', ' gaP ', ' gap ') => ' Gap ', ' gAp ', ' gaP '

THOUGHTS:
-Create a new array n number of elements (including spaces)
-Upcase an index of word based on the current iteration
-Filter out elements that are all lowercase

DATA STRUCTURES:
Array(transformation behavior/selection behavior)

ALGORITHM:
-Create an array with n number of elements from input [" gap " * 5]
  -Iterate over each character and transform to string ' ' => ' gap '

-Iterate over each word element in array with an index  (" gap ", 0), (" gap ", 1)
  -Transform given index to upcase (" "), ("G"), (" ")
    -word[0].upcase, word[1].upcase, word[4].upcase
  -Concatenate with rest of string (" gap ")
    -word[idx+1..word.size] (if index is 0)
    -word[0..idx] + word[idx].upcase + word[idx + 1..-1] (else)
    -word[0...idx] + word[idx].upcase (if array size minus 1 == index)
-Filter out elements that are all lowercase [" Gap ", " gAp ", " gaP "]

=end

def wave(string)
  array = string.chars.map { |char| string }

  array.map.with_index do |word, idx|
    if idx == 0
      word[0].upcase + word[1..-1]
    elsif (array.size - 1) == idx
      word[0...idx] + word[idx].upcase
    else
      word[0...idx] + word[idx].upcase + word[idx + 1..-1]
    end
  end.reject { |word| word.downcase == word }
end


#Refactored solution (behavior with arrays where range starting at length returns
#empty object is also true for strings. 0...0 returns empty string)
def wave(string)
  (0...string.size).each_with_object([]) do |idx, arr|
    next if string[idx] == ' '
    arr << string[0...idx] + string[idx].upcase + string[idx + 1..-1]
  end
end

p wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
p wave("codewars") == ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs", "codewarS"]
p wave("") == []
p wave("two words") == ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"]
p wave(" gap ") == [" Gap ", " gAp ", " gaP "]
