=begin
Consider the word "abode". We can see that the letter a is in position 1 
and b is in position 2. In the alphabet, a and b are also in positions 1
and 2. Notice also that d and e in abode occupy the positions they
would occupy in the alphabet, which are positions 4 and 5.

Given an array of words, return an array of the number of letters that occupy 
their positions in the alphabet for each word. For example,

p symm(["abode","ABc","xyzD"]) == [4, 3, 1]
p symm(["abide","ABc","xyz"]) == [4, 3, 0]
p symm(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"]) == [6, 5, 7]
p symm(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3]


PROBLEM: Take an array of words and return an array of integers represnting
how many letters are in correct alphabetical order
-Input: Array of strings with letters
-Output: Array with count of correctly placed characters relative to alphabet
-Rules:
-Case insensitive

EXAMPLES:
p symm(["abode","ABc","xyzD"]) == [4, 3, 1]
p symm(["abide","ABc","xyz"]) == [4, 3, 0]
p symm(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"]) == [6, 5, 7]
p symm(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3]

THOUGHTS:
-Transformation behavior
-Outer iteration for string words
-Inner iteration to return count of every letter in correct position
  -Iterate with an index relative to all possible characters
-Make string downcase

DATA STRUCTURE:
Array

ALGORITHM:
-Create letters array
-Iterate through each word in array
  -Iterate from 0 upto word.size minus 1 with index
    -Check if word at index equals letter at index

=end

def symm(array)
  array = array.map(&:downcase)
  letter_array = ('a'..'z').to_a

  array.map do |word|
    word.chars.select.with_index do |letter, idx| 
      letter == letter_array[idx]
    end.size
  end
end




p symm(["abode","ABc","xyzD"]) == [4, 3, 1]
p symm(["abide","ABc","xyz"]) == [4, 3, 0]
p symm(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"]) == [6, 5, 7]
p symm(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3]






#Alternate other student solution
=begin
- get an array of strings
- generate a hash of key value pairs:
  - key of each letter in the alphabet along with its index
- check each string in the array of strings:
  - check every char in the string
    - if the characters's index is the same as the same chars index value then add 1
    - else add none and move to the next string
  - return the number of matching indexes in the string and save the result to an array_of_results
  - move onto the next string until there are no more
  - return the array_of_results
=end

=begin
ALPHABET_OF_INDEXES = {}
idx = 0
('a'..'z').each do |char|
  ALPHABET_OF_INDEXES[char] = idx
  idx += 1
end

p ALPHABET_OF_INDEXES

def count_matching_indexes(array_of_strings)
  array_of_strings = array_of_strings.map {|str| str.downcase}
  array_of_results = []
  array_of_strings.each do |str|
    total_matches = 0
    str.split('').each_with_index do |char, idx|
      if ALPHABET_OF_INDEXES.include?(char) && ALPHABET_OF_INDEXES[char] == idx
        total_matches += 1
      end
    end
    array_of_results << total_matches
  end
  array_of_results
end
=end
