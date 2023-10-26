=begin
PROBLEMS: Take a string to search within a text and return the number of times
the search text is found
-Input: String to search and substring to search within string
-Output: Number of occurances of substring in string
-Rules:
-Search text should be based on direct match

EXAMPLES:
solution('abcdeb','b') == 2
solution('abcdeb', 'a') == 1
solution('abbc', 'bb') == 1

THOUGHTS:
-Count method seems like a good idea (this would count characters - not exact substring occurances)
-In that case, we probably have to get all potential substrings
-With the individual substrings, we need to select elements that match an exact pattern
-We need to return sum of the remaining elements

DATA STRUCTURES:
  - Array (to hold all possible substring elements)

ALGORITHM:
  GET ALL POSSIBLE SUBSTRINGS
  - Set substring_array to empty array
  - Iterate from 0 to length of string minus 1 with outer index
    - Iterate from outer index to length of string minus 1 with inner index
      - Push string from outer index to inner index onto substring_array
    -End
  -End
  -Return substring_array

  SELECT ELEMENTS MATCHING AN EXACT PATTERN
  - Iterate over each substring in substring_array
    - Check if given pattern EXACTLY matches substring
  - Return substring_array and count number of elements

=end

def solution(string, pattern)
  substring_array = get_substrings(string)
  substring_array.count { |substring| substring == pattern }
  #substring_array.count { |substring| substring.match?(/\b#{pattern}\b/) }
  #substring_array.select { |string| string.match?(/\A#{pattern}\z/) }.size
  #any of these 3 would work

  #substring_array.count { |substring| p substring.include?(pattern) }
  #include? wouldn't work here because it's searching for substring inclusion
  #within an entire string, not for direct matches
end

def get_substrings(string)
  substring_array = []
  0.upto(string.size - 1) do |outer_idx|
    outer_idx.upto(string.size - 1) do |inner_idx|
      substring_array << string[outer_idx..inner_idx]
    end
  end

  substring_array
end


p solution('abcdeb','b') == 2
p solution('abcdeb', 'a') == 1
p solution('abbc', 'bb') == 1
p solution('abbcbbbacbccbb', 'bb') == 4 #(or 4 depending on if we're checking substrings or string)
p solution('aaabbbcccc', 'bbb') == 1
p solution('aa_bb_cc_dd_bb_e', 'bb') == 2

#Second attempt (happy with how this came out - If checking full string only)
=begin
Take a string to search within a text and return the number of times
the search text is found
solution('abcdeb','b') == 2
solution('abcdeb', 'a') == 1
solution('abbc', 'bb') == 1

PROBLEM: Take a string and return the number of times a given substring is
found in the string
-Input: String of characters and a substring to count instances of
-Output: Count of times exact substring equates to possible substrings
-Rules:
-We want to do EXACT matching

EXAMPLES:
solution('abcdeb','b') == 2
solution('abcdeb', 'a') == 1
solution('abbc', 'bb') == 1

THOUGHTS:
-Can use string split with regex as alternative to getting substrings

=end

#Spliting according to any non-given sub string
def solution(string, sub_str)
  string.split(/[^#{sub_str}]/).select { |elem| elem == sub_str }.size
end

#Using slice_when
def solution(string, sub_str)
  sub_arrs = string.chars.slice_when { |i,j| i != j }.map(&:join)
  sub_arrs.select { |word| word == sub_str }.size
end

p solution('abcdeb','b') == 2
p solution('abcdeb', 'a') == 1
p solution('abbc', 'bb') == 1
p solution('abbcbbbacbccbb', 'bb') == 2 #(or 4 depending on if we're checking substrings or string)
p solution('aaabbbcccc', 'bbb') == 1
p solution('aa_bb_cc_dd_bb_e', 'bb') == 2
