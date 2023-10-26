=begin
PROBLEM: Check the characters in string 1 and see if they all appear in
string 2 at least once
-Input: String 1(to iterate over), string 2(to represent needed characters)
-Output: Boolean based on if all characters in string 2 are in string 1
-Rules:
-Only lowercase will be used
-Consider performance

EXAMPLES:
  scramble('rkqodlw',           'world'     ) == true
  scramble('cedewaraaossoqqyt', 'codewars'  ) == true
  scramble('katas',             'steak'     ) == false
  scramble('scriptjava',        'javascript') == true
  scramble('scriptingjava',     'javascript') == true

THOUGHTS:
  -Need a way to count occurances of each character in string 1 (iterate)
  -Could use a hash to store each letter (a..z) as a key with string 2 occurances as value
  -Iterate over each letter in string 1 and decrement by 1 for each key
  -If all values in hash are 0 or less it's true

DATA STRUCTURE:
Hash (to store occurances)

ALGORITHM:
  -Set letters_hash to (a..z) as keys with each default 0 values
  -Iterate over each letter in string 2 and increment key/value by 1

  -Iterate over each letter in string 1 and decrement hash by 1 for each match
  -If ALL values in hash are less than or equal to 0 then return true
  -False otherwise
=end

def scramble(str1, str2)
  letters_hash = ('a'..'z').each_with_object({}) do |key, hash|
    hash[key] = 0
  end

  str2.chars.each { |char| letters_hash[char] += 1 }
  str1.chars.each { |char| letters_hash[char] -= 1 }
  letters_hash.values.all? { |count| count <= 0 }
end

def scramble(str1, str2)
  str2.each_char do |letter|
    return false if str2.count(letter) > str1.count(letter)
  end
  true
end

# SECOND ATTEMPT (Happy with how this came out)
=begin
Complete the function scramble(str1, str2) that returns true if a portion of 
str1 characters can be rearranged to match str2, otherwise returns false.
Only lower case letters will be used (a-z). No punctuation or digits will be included.

PROBLEM: If string2 has all letters from string1 in the same or greater amount,
return true. False otherwise
EXAMPLES:
('javaass',           'jiss'      ) => [j = 1, j = 1], [i = 0, i = 1], [s = 2, s = 2]
('cedewaraaossoqqyt', 'codewars'  ) => [c = 1, c= 1], [o = 2, o = 1], [d = 1, d = 1]

THOUGHTS:
-Iterate through each unique character in string 2 (j,i,s)
  -String1 count of letter greater than or equal to count of letter in string2 (j, i, s)
-Need to return false if above isn't true

DATA STRUCTURES:
Array

ALGORITHM:
-Iterate through each unique character in string 2 (j,i,s)
  -Return true if all characters in string1 have a count >= count in string2
  (j = 1, j = 1), (i = 0, i = 1), (s = 2, s = 2)

=end

def scramble(string1, string2)
  string2.chars.uniq.all? { |char| string1.count(char) >= string2.count(char) }
end

p scramble('javaass',           'jiss'      ) == false
p scramble('rkqodlw',           'world'     ) == true
p scramble('rodlw',           'wooorld'     ) == false
p scramble('cedewaraaossoqqyt', 'codewars'  ) == true
p scramble('katas',             'steak'     ) == false
p scramble('scriptjava',        'javascript') == true
p scramble('scriptingjava',     'javascript') == true
