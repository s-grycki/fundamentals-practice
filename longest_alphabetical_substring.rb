# Find the longest substring in alphabetical order.
# Example: the longest alphabetical substring in "asdfaaaabbbbcttavvfffffdf" is "aaaabbbbctt".
# The input will only consist of lowercase characters and will be at least one letter long.
# If there are multiple solutions, return the one that appears first.

#p longest('asd') == 'as'
#p longest('nab') == 'ab'
#p longest('abcdeapbcdef') == 'abcde'
#p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
#p longest('asdfbyfgiklag') == 'fgikl'
#p longest('z') == 'z'
#p longest('zyba') == 'a'

=begin
PROBLEM: Check possible substrings from index 0 to last index and return the
longest substring where the letters never decline in successive value
-Input: String of lowercase letters
-Output: Longest substring that has all rising values
-Rules:
-If entire string declines in value return last character
-If there are multiples solutions, defer to first one that appears

EXAMPLES:
p longest('asd') == 'as'
p longest('nab') == 'ab'
p longest('abcdeapbcdef') == 'abcde'
p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
p longest('asdfbyfgiklag') == 'fgikl'
p longest('z') == 'z'
p longest('zyba') == 'a'

THOUGHTS:
-Get all possible substrings
-Checking if current character is greater in value than last character
-Need a way to track value of last or next element relative to current element

DATA STRUCTURES:
Array(to hold all valid substrings)

ALGORITHM:
-Set substring_array to empty array
-Iterate from 0 upto 1 less than string size with outer_idx
  -Set size_str to empty string
  -Iterate from outer_idx upto 1 less than string size with inner_idx
    -If string at outer_idx through inner_idx last character is less than next element
      -Append string from outer_idx through inner_idx onto size_str
    -If it's larger
      -Push size_str onto substring_array and break inner loop
  -Get largest string from substring_array

=end


=begin
def longest(string)
  longest_substring = ''

  0.upto(string.size - 1) do |outer_idx|
    current_str = string[outer_idx]

    outer_idx.upto(string.size - 1) do |inner_idx|
      prev_char = ''

      if prev_char <= string[inner_idx]
        current_str += string[inner_idx]
      else
        break
      end

      prev_char = string[inner_idx]
    end
  end

  longest_substring
end
=end


def longest(string)
  prev_char = ''
  current_string = ''
  longest_string = ''

  string.each_char do |char|
    if prev_char <= char
      current_string += char 
    else
      current_string = char
    end

    if current_string.size > longest_string.size
      longest_string = current_string
    end

    prev_char = char
  end

  longest_string.size == 1 ? string[-1] : longest_string
end


#Why does a single iterator work here?
#In this solution, we iterate over each character once and capture the
#current character at the end of the block to compare it with the next.
#It's this capturing of the previous character that allows for single 
#iteration. The current string is captured based on a condition or reassigned
#to the next single character. Then it's checked if the current concatenating
#string is larger than the one currently stored

#What were you trying to accomplish with nested iteration that you thought
#single iteration couldn't solve?
#My thinking is that I needed to get every possible substring. If I just checked
#from the 0 index each time, then that would fail to get all possible substrings.
#So I would go from index 0 in an outer loop and continue with an inner loop until
#that inner index hit a smaller value than the current one. It would then continue
#to the next outer index. Logically, this would arrive at the same conclusion, but
#in a more time complex manner. If the current letter evaluated as smaller than the
#previous one, then why check it again? That's just a single character. You find
#the longest substring starting from the first index where it begins. We don't
#care about the substrings that are contained within this answer. If you want the
#longest possible substring, then you will get it by starting with the first valid
#character. If you need all substrings to be of a certain length, then you only
#need an incrementing single index. If you need all possible substirngs, or you
#need to check something from all possible substrings, then use nested iteration


#p longest('asd') #== 'as'
#p longest('nab') #== 'ab'
#p longest('abcdeapbcdef') #== 'abcde'
#p longest('asdfaaaabbbbcttavvfffffdf') #== 'aaaabbbbctt'
#p longest('asdfbyfgiklag') #== 'fgikl'
#p longest('z') #== 'z'
#p longest('zyba') #== 'a'



#Second attempt answers


#Slices an array of elements based on the truthiness of the block
#Can't just use max_by because equivalent string sizes should overwrite current max
#*If understanding of problem was consistent with this logic*
def longest(str)
  longest = ''
  chunks = str.chars.slice_when { |prev, cur| prev > cur }.to_a#.max_by(&:size).join
  chunks.each { |arr| longest = arr.join if arr.size >= longest.size }
  longest
end

#Chunks an array of elements based on the falsyness of the block
def longest(str)
  str.chars.chunk_while { |prev, cur| prev <= cur }.map(&:join)
  arrs.size == str.size ? str[-1] : arrs.max_by(&:size)
end

#These methods seem good for getting substrings based on adjacent element comparisons
def longest(str)
  arrs = str.chars.slice_when { |prev, cur| prev > cur }.map(&:join)
  arrs.size == str.size ? str[-1] : arrs.max_by(&:size)
end

p longest('asd') == 'as'
p longest('nab') == 'ab'
p longest('abcdeapbcdef') == 'abcde'
p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
p longest('asdfbyfgiklag') == 'fgikl'
p longest('z') == 'z'
p longest('zyba') == 'a'
