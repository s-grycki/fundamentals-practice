=begin
PROBLEM: Take a string and return the SAME string with all even indexes upcased
and all odds downcased
-Input: A string of alphabetical characters and spaces
-Output: Same string with alternating case - ignoring spaces
-Rules:
-Ignore spaces when determining case
-0 index is considered even
-Should we mutate string? (Theres no bang at end of method, so no)
-If you hit a new word you need to start over index count for each word

EXAMPLES:
weirdcase('This') == 'ThIs'
weirdcase('is') == 'Is'
weirdcase('This is a test') == 'ThIs Is A TeSt'

THOUGHTS:
-We want to iterate over each character in each word
-We need an index for each seperate occurance of word
-We need a way to ignore spaces
  -Split each word into array elements and further split this into an
  array of characters
  -Transform each character in each word based on index
  -Rejoin with space deliminator for each word

DATA STRUCURE:
Array (to use map method on each word)

ALGORITHM:
-Split each word in input string to seperate array element

-Iterate over each character in array with index
  -Transform each character to upcase if even index, downcase otherwise
-Rejoin back into string with space deliminator

=end



# Would have worked with previous understanding of problem
def weirdcase(string)
  counter = -1
  string.chars.map do |char|
    next ' ' if char == ' '
    counter += 1
    counter.even? ? char.upcase : char.downcase
  end.join
end
# This will transform each element based on the return value of the block for
# each iteration. The return value of the block is the last statement evaluated.
# Next would skipped each iteration with a space while still returning a space
# and not incrementing the counter. Next would have been the last statement
# evaluated on these iterations



def weirdcase(string)
  chars_array = string.split.map(&:chars)
  chars_array.map do |arr|
    arr.map.with_index do |char, idx|
      idx.even? ? char.upcase : char.downcase
    end.join
  end.join(' ')
end





#weirdcase('This') #== 'ThIs'
#weirdcase('is') #== 'Is'
#p weirdcase('This is a test') #== 'ThIs Is A TeSt'


#Second attempt
=begin
PROBLEM: Take a string input and return each even index uppercased while
each odd index are lowercased. Start over the count if there are multiple
words
-Input: A string of word(s)
-Output: A string with all original elements transformed
-Rules:
-Input will only be alphabetical characters
-Words are sperated by spaces

EXAMPLES:
weirdcase('This') == 'ThIs'
weirdcase('is') == 'Is'
weirdcase('This is a test') == 'ThIs Is A TeSt'

THOUGHTS:
Check the index value of each character per word and transform
Iterate over arrays within an array with each word character as an element
Need to track index value and reset it for each word

DATA STRUCTURES:
Nested array(to contain each character in the word)

ALGORITHM:
-Split each word into an array element and seperate by characters
-Iterate over each character in each array with an index on the inner arrays
  -Tranform each even elment to upcase, each odd to downcase
-Return back into string format with words seperated by spaces

=end

def weirdcase(string)
  string.split.map(&:chars).map do |char_array|
    char_array.map.with_index do |char, idx|
      idx.even? ? char.upcase : char.downcase
    end.join
  end.join(' ')
end


p weirdcase('This') == 'ThIs'
p weirdcase('is') == 'Is'
p weirdcase('This is a test') == 'ThIs Is A TeSt'

