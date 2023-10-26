=begin
Complete the function that takes an array of words.
You must concatenate the nth letter from each word to construct a new word which
 should be returned as a string,
where n is the position of the word in the list.

For example:
["yoda", "best", "has"] --> "yes"
^ ^ ^
n=0 n=1 n=2
Note: Test cases contain valid input only - i.e. a string array or an empty array; 
and each word will have enough letters.

PROBLEM:
Take an array of words(input)
Return a concatenation of each letter starting at first and going up(output)
Assume each word will have enough letters(Explicit Rule)
Assume tests will contain only valid input - array of strings or empty array(Explicit Rule)

EXAMPLES:

DATA STRUCTURES:
Input: Array
Intermediate: Arrays(arrays of individual characters in word)
Output: String

THOUGHTS:
[][0] will return nil

ALGORITHM:
Iterate over each word in array with an index ('yoda', 'best', 'has') (0), (1), (2)
  Get letter at current index relative to word 'y', 'e', 's'
  Push letter onto a new string 'yes'
Return new string

=end

def nth_char(array)
  str = ''
  array.each_with_index { |word, idx| str << word[idx] }
  str
end

# Refactored with reduce using a string accumulator
def nth_char(array)
  array.size.times.reduce('') { |str, idx| str << array[idx][idx]  }
end

p nth_char(['yoda', 'best', 'has']) == 'yes'
p nth_char([]) == ''
p nth_char(['X-ray']) == 'X'
p nth_char(['No', 'No']) == 'No'
p nth_char(['Chad', 'Morocco', 'India', 'Algeria', 'Botswana', 'Bahamas', 'Ecuador', 'Micronesia']) == 'Codewars'
