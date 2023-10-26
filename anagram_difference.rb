=begin
Given two words, how many letters do you have to remove from them to make them anagrams?
Example
First word : c od e w ar s (4 letters removed)
Second word : ha c k er r a nk (6 letters removed)
Result : 10
Hints
A word is an anagram of another word if they have the same letters (usually in a different order).
Do not worry about case. All inputs will be lowercase.

PROBLEM: Take two strings of letters and return how many need to be removed from both in
order for them to be anagrams

EXAMPLES:
('a', '') => ('a','') => 1
('ab', 'a') => ('b', '') => 1
('ab', 'ba') => ('b', 'b') => ('', '') => 0
('ab', 'cd') => ('ab', 'cd') => ('ab', 'cd') => 4 (length of both strings)
('aab', 'a') => ('ab', '') => 2

THOUGHTS:
-Use copy strings (deleting while iterating)
-Return remaining length of both strings
-Only need to iterate over smaller string

ALGORITHM:
-Set min_arr, max_arr to array of characters from string1 and string2 (based on minmax)
-Iterate over each letter in the smaller string input 'codewars' => 'odewars' => 'odwars' => 'odwrs' => 'odws'
  -If current letter is included in larger array 'hackerrank' => 'hakerrank' => 'hakrrank' => 'hkrrank' => 'hkrank'
    -Delete first instance of letter from both arrays 'c', 'e', 'a', 'r' (anagram letters)
-Return min_arr + max_arr size
  

=end

def anagram_difference(str1, str2)
  min_arr, max_arr = [str1.chars, str2.chars].minmax

  [str1, str2].min.each_char do |char|
    if max_arr.include?(char)
      min_arr.delete_at(min_arr.index(char))
      max_arr.delete_at(max_arr.index(char))
    end
  end
  (min_arr + max_arr).size
end

p anagram_difference('', '') == 0
p anagram_difference('a', '') == 1
p anagram_difference('', 'a') == 1
p anagram_difference('ab', 'a') == 1
p anagram_difference('ab', 'ba') == 0
p anagram_difference('ab', 'cd') == 4
p anagram_difference('aab', 'a') == 2
p anagram_difference('a', 'aab') == 2
p anagram_difference('codewars', 'hackerrank') == 10
