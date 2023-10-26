=begin
PROBLEM: Take an array of strings and find the largest common prefix amongst all
of them
-Input: Array of string words
-Output: String representing largest common prefix from array
-Rules:
-Return empty string if no commons
-All inputs are lowercase
-Arrays could have variable number of elements

EXAMPLES:
common_prefix(['flower', 'flow', 'flight']) == 'fl'
common_prefix(['dog', 'racecar', 'car']) == ''
common_prefix(['interspecies', 'interstellar', 'interstate']) == 'inters'
common_prefix(['throne', 'dungeon']) == ''
common_prefix(['throne', 'throne']) == 'throne'

THOUGHTS:
-Only need to iterate over smallest string element in array to compare
-Terminate checking once prefixes aren't equal across strings

-Feel logically stuck on how to get my iterator to stay on a single array 
element and compare the equal index values to the other strings

-Want to iterate over each character and compare at equal index values
relative to ALL words in given index
-This is a good place to think about EXACTLY what you should be iterating over
Should it be a single word? The characters within the word?

DATA STRUCTURES:
Array

ALGORITHM:
  - Set small_word to size of minimum of input array
  - Set prefix_string to empty string
  - Iterate over each word in array with index
    - If ALL words at current index are equal
      - Add character at index to prefix_string
    - Break prefix_string if index == small_word - 1

=end

def common_prefix(array)
  small_word = array.min
  prefix_string = ''
  small_word.chars.each_with_index do |char, idx|
    if array.all? { |word| word[idx] == char }
      prefix_string << char 
    else
      break prefix_string
    end
  end
  prefix_string
end




# p common_prefix(['flower', 'flow', 'flight']) == 'fl'
# p common_prefix(['dog', 'racecar', 'car']) == ''
# p common_prefix(['interspecies', 'interstellar', 'interstate']) == 'inters'
# p common_prefix(['throne', 'dungeon']) == ''
# p common_prefix(['throne', 'throne']) == 'throne'





#Second attempt
=begin
Take an array of strings and find the largest common prefix amongst all
of them
common_prefix(['flower', 'flow', 'flight']) == 'fl'
common_prefix(['dog', 'racecar', 'car']) == ''
common_prefix(['interspecies', 'interstellar', 'interstate']) == 'inters'
common_prefix(['throne', 'dungeon']) == ''
common_prefix(['throne', 'throne']) == 'throne'

PROBLEM: Take an array of strings and find the largest common prefix among them
-Input: Array of string words
-Output: The largest shared prefix among all of them
-Rules:
-If no common prefix return empty string
-If same string multiple times, return string

EXAMPLES:
common_prefix(['flower', 'flow', 'flight']) == 'fl'
common_prefix(['dog', 'racecar', 'car']) == ''
common_prefix(['interspecies', 'interstellar', 'interstate']) == 'inters'
common_prefix(['throne', 'dungeon']) == ''
common_prefix(['throne', 'throne']) == 'throne'

THOUGHTS:
Checking each string in the array and seeing if all indexes have the same character
Iterate over all elements of a shared index and check if they're equivalent
Need a current character from one of the words to check

DATA STRUCTURE:
Array(to hold words and word to iterate over)

ALGORITHM:
-Set prefix_str to empty string
-Get the smallest element from array and iterate over each character
-Iterate over all words in input array and check if all equal current character at index
  -If so, concat to prefix_str
-Return prefix_str

=end

def common_prefix(array)
  prefix_str = ''
  array.min.chars.each_with_index do |char, idx|
    prefix_str << char if array.all? { |word| word[idx] == char }
  end
  prefix_str
end

p common_prefix(['flower', 'flow', 'flight']) == 'fl'
p common_prefix(['dog', 'racecar', 'car']) == ''
p common_prefix(['interspecies', 'interstellar', 'interstate']) == 'inters'
p common_prefix(['throne', 'dungeon']) == ''
p common_prefix(['throne', 'throne']) == 'throne'
