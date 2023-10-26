=begin
PROBLEM: Take a string of all lowercase letters and return the length of the
longest vowel substring
-Input: String of lowercase letters
-Output: Integer represnting largest substring of consecutive vowels
-Rules:
-Is it possible to have no vowels in given strings?

EXAMPLES:
  solve("codewarriors") == 2
  solve("suoidea") == 3
  solve("iuuvgheaae") == 4
  solve("ultrarevolutionariees") == 3
  solve("strengthlessnesses") == 1
  solve("cuboideonavicuare") == 2
  solve("chrononhotonthuooaos") == 5
  solve("iiihoovaeaaaoougjyaw") == 8

THOUGHTS:
- Need all possible substrings
- Could select only substrings from substring_array with contain ALL (aeiou)
- Could return max value from selected array

DATA STRUCTURE:
  - Array (to group substrings)

ALGORITHM:
  GET ALL POSSIBLE SUBSTRINGS
    - Set substring_array to empty array
    - Iterate from 0 upto string size minus 1 with outer index
      - Iterate from outer index upto string size minus 1 with inner index
        - Push string from outer to inner index onto substring_array
    - Return substring_array

  SELECT SUBSTRINGS WITH ALL VOWELS OF ANY INSTANCE
    - Iterate over substrings in substring_array
      - Check if ALL characters in substring include vowels
    - Return substring_array
  
  GET LARGEST STRING FROM ARRAY
    - Iterate over each element in array
      - Convert each element to size of element
    - Return largest element
=end

def solve(string)
  substring_array = get_substrings(string)
  substring_vowels = only_vowel_substrings(substring_array)
  substring_vowels.map { |string| string.size }.max
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

def only_vowel_substrings(substring_array)
  substring_array.select do |substring|
    substring.chars.all? { |char| %(a e i o u).include?(char) }
  end
end



#Alternate solution with single iteration
def solve(string)
  current_str = ''
  longest_str = ''

  string.each_char do |char|

    if %w(a e i o u).include?(char)
      current_str += char
    else
      current_str = ''
    end

    if current_str.size > longest_str.size
      longest_str = current_str
    end

  end

  longest_str.size
end


p solve("codewarriors") == 2
p solve("suoidea") == 3
p solve("iuuvgheaae") == 4
p solve("ultrarevolutionariees") == 3
p solve("strengthlessnesses") == 1
p solve("cuboideonavicuare") == 2
p solve("chrononhotonthuooaos") == 5
p solve("iiihoovaeaaaoougjyaw") == 8



#Second attempt (happy with this)
=begin
Take a string of all lowercase letters and return the length of the
longest vowel substring

solve("codewarriors") == 2
solve("suoidea") == 3
solve("iuuvgheaae") == 4
solve("ultrarevolutionariees") == 3
solve("strengthlessnesses") == 1
solve("cuboideonavicuare") == 2
solve("chrononhotonthuooaos") == 5
solve("iiihoovaeaaaoougjyaw") == 8

PROBLEM: Take a string of lowercase letters and return the length of the
longest vowel substring
-Input: String of lowercase letters
-Output: Integer representing longest vowel substring
-Rules:
-Vowel substring is any substring with all consecutive vowels (a e i o u)

EXAMPLES:
solve("codewarriors") == 2
solve("suoidea") == 3
solve("iuuvgheaae") == 4
solve("ultrarevolutionariees") == 3
solve("strengthlessnesses") == 1
solve("cuboideonavicuare") == 2
solve("chrononhotonthuooaos") == 5
solve("iiihoovaeaaaoougjyaw") == 8

THOUGHTS:
-Only concerned about where longest substring begins
-Need way to contain longest current substring
  -Default variable to 0
-Start at first character and keep going until non-vowel
-We could just split using regex class selector

ALGORITHM:
-Split string based on any character that isn't a vowel
-Return size of largest element

=end

def solve(string)
  string.split(/[^aeiou]/).max_by { |str| str.size }.size
end

p solve("codewarriors") == 2
p solve("suoidea") == 3
p solve("iuuvgheaae") == 4
p solve("ultrarevolutionariees") == 3
p solve("strengthlessnesses") == 1
p solve("cuboideonavicuare") == 2
p solve("chrononhotonthuooaos") == 5
p solve("iiihoovaeaaaoougjyaw") == 8
