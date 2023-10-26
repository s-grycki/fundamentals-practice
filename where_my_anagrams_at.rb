=begin
What is an anagram? Well, two words are anagrams of each other if they both 
contain the same letters. For example:
'abba' & 'baab' == true
'abba' & 'bbaa' == true
'abba' & 'abbba' == false
'abba' & 'abca' == false

Write a function that will find all the anagrams of a word from a list. 
You will be given two inputs a word and an array with words. 
You should return an array of all the anagrams or an empty array if there are none. 
For example:

PROBLEM:
Take an array of words and a word string to test which array items are anagrams
of the string. Return anagram elements in new array

EXAMPLES:
'abba', ['aabb', 'abcd', 'bbaa', 'dada']  == ['aabb', 'bbaa']
(they have the same count of the same letters)

THOUGHTS:
-Need a count of every letter in the input (hash)
  -To compare with elements in array
-Need to iterate over each string in array
  -Get a count of every letter in the element (careful with transformation behavior)
    -Select words that have same count of all same letters

DATA STRUCUTRES:
Hash(letter counts)

ALGORITHM:
-Set letter_count to hash with count of every letter from input ('a' => 2, 'b' => 2)
-Iterate over each word in array
  -Set inner_letter_count to hash with count of every letter from element ('a' => 2, 'b' => 2)
    -If letter_count == inner_letter_count
      -Return current element

=end

def anagrams(input, array)
  letter_count = input.chars.uniq.each_with_object({}) do |letter, hash|
    hash[letter] = input.count(letter)
  end

  array.select do |word|
    word.chars.uniq.each_with_object({}) do |letter, hash|
      hash[letter] = word.count(letter)
    end == letter_count
  end
end

p anagrams('abba', ['aabb', 'abcd', 'bbaa', 'dada']) == ['aabb', 'bbaa']
p anagrams('racer', ['crazer', 'carer', 'racar', 'caers', 'racer']) == ['carer', 'racer']
p anagrams('laser', ['lazing', 'lazy', 'lacer']) == []
