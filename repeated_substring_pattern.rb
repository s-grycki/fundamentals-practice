=begin
PROBLEM: (Start with inputs/outputs if confused. Read -> examples -> qs)
Given a string of words, check each word to see if there are duplicating letters
Input: String of words
Output: A boolean to represent if there are any duplicate substrings within a word
Rules: (Also clarifies edge cases and questions)
  - 


EXAMPLES:


DATA STRUCTURES: (Update co-currently with algorithm, if needed)
  - Array

<====== THOUGHT PAD ======>
You did a good job of starting high level with the algorithm and breaking the
problem into steps. Your instinct to use helper methods to break up tasks was
a good one. Where you started to go wrong with the solution was in the
substrings method and not taking the time to trace back the problem of incorrect
elements to code/algorithm logic from before. This is why testing VERY frequently
on seemingly complex code is so important. Go back and see if you can spot where
your logic encountered an error


<=========================>


Algorithm: (View as series of steps. Start high level on complex problems)
  - Iterate over each word string split into an array
    - Get all possible substrings from string
    - Check if any string patterns match

  - Iterate over each character in word with index
    - Iterate over each character in word
      - Add any substrings at least 2 characters from index onto substring_array

  - Iterate over each substring
    - Get the length of each substring / 2
    - Loop for length of substring / 2
      - check if any idx of substr == -idx of substr
    - End loop


=end

def repeated_substring_pattern(str)
  str.split.each_with_object([]) do |word, substring_array|
    substring_array << substrings(word)
  end
  #boolean_array = any_repeating?(substring_array)
end

def substrings(word)
  array = []
  word.chars.each_with_index do |outer_char, idx|
    word.chars.each do |inner_char|
      array << word[idx..-1]
    end
  end
  array.uniq.select { |substr| substr.size >= 2 }
end

def any_repeating?(substring_array)
  substring_array.any? do |substr|
    idx = (substr.size / 2) + 1
    idx -= 1
  end
end

repeated_substring_pattern('bunny')






#Second attempt
=begin

Given a string of words, check each word to see if there are duplicating letters
repeated_substring_pattern('bunny') == true
repeated_substring_pattern('cat') == false
repeated_substring_pattern('The cow jumped over the moon') == true
repeated_substring_pattern('ToO mAnY oS') == false


PROBLEM: Take a string of words, and check each word to see if there are
duplicating letters. Return true if so, false if no repeats in any words
-Input: String of words
-Output: A boolean based on if characters in ANY words repeat
-Rules:
-Case matters
-We only care about duplicating letters

EXAMPLES:
repeated_substring_pattern('bunny') == true
repeated_substring_pattern('cat') == false
repeated_substring_pattern('The cow jumped over the moon') == true
repeated_substring_pattern('ToO mAnY oS') == false

THOUGHTS:
-Check each word for duplicate letters (different words can share letters)
-Iterate over every upper and lower case letter and see if count is greater than 1

DATA STRUCTURES:
Array(to contain words is strings as seperate elements)

ALGORITHM:
-Split each word in array
  -Iterate over each word in array
    -Iterate over all upper and lower case letters
      -If any count to greater than 1 return true
-Return false if never executes

=end


def repeated_substring_pattern(string)
  valid_chars = ('A'..'Z').to_a + ('a'..'z').to_a
  string.split.each do |word|
    return true if valid_chars.any? { |letter| word.count(letter) > 1 }
  end
  false
end


p repeated_substring_pattern('bunny') == true
p repeated_substring_pattern('cat') == false
p repeated_substring_pattern('The cow jumped over the moon') == true
p repeated_substring_pattern('ToO mAnY oS') == false
