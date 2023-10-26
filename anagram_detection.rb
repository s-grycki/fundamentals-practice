=begin
An anagram is the result of rearranging the letters of a word to produce a new word
Note: anagrams are case insensitive
Complete the function to return true if the two arguments given are anagrams of 
each other; return false otherwise.

Examples
"foefet" is an anagram of "toffee"
"Buckethead" is an anagram of "DeathCubeK"

PROBLEM: Take two strings and return true if they are anagrams, false otherwise.
Ignore case

EXAMPLES:
'Creative', 'Reactive' => Exact same count of the exact same letters (ignoring case) 
"apple", "pale" => Different count of the letter p (false)

THOUGHTS:
-Use hash to count of letters in both strings
-Rationalize case at beginning of method
-Return false UNLESS both hashes equate to same

DATA STRUCTURES:
Hash(to store letter counts)

ALGORITHM:
-Str1, str2 = str1 and str2 downcased
-Iterate through each unique letter in str1 with a new hash
  -Set hash key to letter and value to count of letter in str1
-Iterate through each unique letter in str2 with a new hash
  -Set hash key to letter and value to count of letter in str2
-Return false unless hash1 == hash2
-Return true

=end

def is_anagram(str1, str2)
  str1, str2 = str1.downcase, str2.downcase

  hash1 = str1.chars.uniq.each_with_object({}) do |letter, hash|
    hash[letter] = str1.count(letter)
  end

  hash2 = str2.chars.uniq.each_with_object({}) do |letter, hash|
    hash[letter] = str2.count(letter)
  end

  hash1 == hash2
end

#Alternate solution
def is_anagram(str1, str2)
  return false unless str1.size == str2.size

  str1, str2 = str1.downcase, str2.downcase
  str1.chars.uniq.all? { |letter| str1.count(letter) == str2.count(letter) }
end

p is_anagram('Creative', 'Reactive') == true
p is_anagram("foefet", "toffee") == true
p is_anagram("Buckethead", "DeathCubeK") == true
p is_anagram("Twoo", "WooT") == true
p is_anagram("dumble", "bumble") == false
p is_anagram("ound", "round") == false
p is_anagram("apple", "pale") == false
