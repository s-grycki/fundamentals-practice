# Given 2 strings, your job is to find out if there is a substring
# that appears in both strings. You will return true if you find a
# substring that appears in both strings, or false if you do not.
# We only care about substrings that are longer than one letter long.

=begin
PROBLEM: Take the substrings of two input strings and return true if there is
a substring that appears in both strings, false otherwise
-Input: Two strings of characters
-Output: True or false boolean
-Rules:
-Substrings are more than one character in this problem
-Checks are case insensitive
-An empty string isn't a substring

EXAMPLES:
substring_test('Something', 'Fun') == false
substring_test('Something', 'Home') == true
substring_test('Something', '') == false
substring_test('', 'Something') == false
substring_test('BANANA', 'banana') == true
substring_test('test', 'lllt') == false
substring_test('', '') == false
substring_test('1234567', '541265') == true
substring_test('supercalifragilisticexpialidocious', 'SoundofItIsAtrociou')

THOUGHTS:
-Don't want to do exact string matching - want to check inclusion
-Want this check to be case insensitive
-Can check if smaller substrings are in larger string
-Want to iterate over each substring and see if ANY are included in larger string

DATA STRUCTURES:
Arrays (to contain substrings from smaller word)

ALGORITHM:
GET SUBSTRINGS
  -Set substring_array to empty array
  -0 upto string size minus 1 with outer index
    -Outer index plus 1 upto string size minus 1 with inner index
      -Push string[outer index..inner index] onto substring_array
  -Return substring_array

CHECK IF EACH SUBSTRING IS INCLUDED IN LARGER STRING
  -Iterate over each substring in substring_array
    -If ANY substrings are included in larger string return true
    -False otherwise
=end

def substring_test(str1, str2)
  small_str, large_str = [str1, str2].minmax
  substring_array = get_substrings(small_str)
  substring_array.any? do |substring|
    large_str.downcase.include?(substring.downcase)
  end
end

def get_substrings(str)
  substring_array = []
  0.upto(str.size - 1) do |outer_idx|
    (outer_idx + 1).upto(str.size - 1) do |inner_idx|
      substring_array << str[outer_idx..inner_idx]
    end
  end
  substring_array
end


#Alternate answer using each_cons
def substring_test(str1, str2)
  substring_array = []
  small, large = [str1, str2].minmax
  small, large = small.downcase, large.downcase
  return false if small.size < 2 || large.size < 2

  #Since the problem only cares about any, we can just match pairs of 2
  small.chars.each_cons(2) { |sub_arr| substring_array << sub_arr.join }
  
  substring_array.any? { |sub_str| large.include?(sub_str) }
end

p substring_test('Something', 'Fun') == false
p substring_test('Something', 'Home') == true
p substring_test('Something', '') == false
p substring_test('', 'Something') == false
p substring_test('BANANA', 'banana') == true
p substring_test('test', 'lllt') == false
p substring_test('', '') == false
p substring_test('1234567', '541265') == true
p substring_test('supercalifragilisticexpialidocious', 'SoundofItIsAtrociou')




#Second attempt
=begin
Take the substrings of two input strings and return true if there is
a substring that appears in both strings, false otherwise
substring_test('Something', 'Fun') == false
substring_test('Something', 'Home') == true
substring_test('Something', '') == false
substring_test('', 'Something') == false
substring_test('BANANA', 'banana') == true
substring_test('test', 'lllt') == false
substring_test('', '') == false
substring_test('1234567', '541265') == true
substring_test('supercalifragilisticexpialidocious', 'SoundofItIsAtrociou')

PROBLEM: Take 2 strings and return true if there is a substring in the
smaller string that's included in the larger one. False otherwise
-Input: 2 strings of words
-Output: True if there's a shared substring, false otherwise
-Rules:
-Exact substring matching between strings
-Case doesn't matter
-Empty inputs evaluate to false
-Single characters aren't a substring

EXAMPLES:
substring_test('Something', 'Fun') == false
substring_test('Something', 'Home') == true
substring_test('Something', '') == false
substring_test('', 'Something') == false
substring_test('BANANA', 'banana') == true
substring_test('test', 'lllt') == false
substring_test('', '') == false
substring_test('1234567', '541265') == true
substring_test('supercalifragilisticexpialidocious', 'SoundofItIsAtrociou')

THOUGHTS:
-Get every possible substring greater than one character from smaller string
-Check if any substrings are found in larger string in exact pattern

DATA STRUCTURES:
Array(to hold substrings)

ALGORITHM:
-Return false if either string is empty
-Set substr_array to empty array
-Set small_str to min of inputs
-Iterate from 0 upto 1 minus small string size with outer_idx 
  -Iterate from outer_idx + 1 upto string size minus 1
    -Push string from outer_idx to inner_idx onto substr_array

-Iterate over substring in substr_array
  -Check if any EXACTLY match a pattern in the larger string and return true if so
-False otherwise

=end

def substring_test(string1, string2)
  return false if string1.empty? || string2.empty?
  substr_array = []
  string1, string2 = string1.downcase, string2.downcase
  small_str, large_str = [string1, string2].minmax

  0.upto(small_str.size - 1) do |outer_idx|
    (outer_idx + 1).upto(small_str.size - 1) do |inner_idx|
      substr_array << small_str[outer_idx..inner_idx]
    end
  end
  substr_array.any? { |substr| large_str.include?(substr) }
end


p substring_test('Something', 'Fun') == false
p substring_test('Something', 'Home') == true
p substring_test('Something', '') == false
p substring_test('', 'Something') == false
p substring_test('BANANA', 'banana') == true
p substring_test('test', 'lllt') == false
p substring_test('', '') == false
p substring_test('1234567', '541265') == true
p substring_test('supercalifragilisticexpialidocious', 'SoundofItIsAtrociou') == true
