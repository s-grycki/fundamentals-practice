=begin

Given array of strings made only of lowercase letters, return array of all 
characters that show up in all strings within the given array (including duplicates) 
For example, if a character occurs 3 times in all strings, but not 4 times, 
you need to include that character three times in the final answer.

p common_chars(['bella', 'label', 'roller']) == ['e', 'l', 'l']
p common_chars(['cool', 'lock', 'cook']) == ['c', 'o']
p common_chars(['hello', 'goodbye', 'booya', 'random']) == ['o']
p common_chars(%w(aabbaaaa ccdddddd eeffee ggrrrrr yyyzzz) == []

PROBLEM: Take an array of lowercase letter strings and return an array
of shared letters between all strings. Duplicates should be counted
-Input: Array of lowercase strings
-Output: Shared letters in new array
-Rules:
-Return empty array of no common elements

EXAMPLES:
p common_chars(['bella', 'label', 'roller']) == ['e', 'l', 'l']
p common_chars(['cool', 'lock', 'cook']) == ['c', 'o']
p common_chars(['hello', 'goodbye', 'booya', 'random']) == ['o']
p common_chars(%w(aabbaaaa ccdddddd eeffee ggrrrrr yyyzzz) == []

THOUGHTS:
-Order of output seems relative to order of first string
  -Selecting elements from first string
-Don't count characters that have already been matched
  -Delete copy elements
-Iterate over each character in the first string
  -Iterate over each character in rest of strings to check for match

DATA STRUCTURES:
Arrays

ALGORITHM:
-Set clone_array to new array with all strings cloned
-Delete first string from clone_array and set to first_string

-Select characters in first_string which are found in all clone_array elements
  -If any are matched then destructively substitute character for nothing 

=end


#sub! will return the mutated string or nil if nothing was changed. This is different
#from sub, which will always return a new string regardless. Unlike gsub, sub will only
#replace the first occurance
def common_chars(array)
  clone_array = array.map(&:clone)
  first_string = clone_array.shift.chars

  first_string.select do |char|
    clone_array.all? { |word| word.sub!(char, "") }
  end
end

#This is fine because nothing in first string variable is being mutated and
#there will always be a character sub! is trying to replace
def common_chars(array)
  first_string = array.shift.chars

  first_string.select do |char|
    array.all? { |word| word.sub!(char, "") }
  end
end

#without sub method
def common_chars(array)
  shared_letters = []
  word = array.delete(array.min_by(&:size))
  array = array.map(&:chars)

  word.each_char do |char|
    if array.all? { |word| word.include?(char) }
      shared_letters << char
      array.each { |word| word.delete_at(word.index(char)) }
    end
  end
  shared_letters
end



p common_chars(['bella', 'label', 'roller']) == ['e', 'l', 'l']
p common_chars(['cool', 'lock', 'cook']) == ['c', 'o']
p common_chars(['hello', 'goodbye', 'booya', 'random']) == ['o']
p common_chars(%w(aabbaaaa ccdddddd eeffee ggrrrrr yyyzzz)) == []
