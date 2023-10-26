=begin
PROBLEM: Given a string, detect whether or not it's a pangram
-Input: String of characters
-Output: Boolean based on if each letter of alphabet  is counted once in string
-Rules:
-Case isn't important
-Ignore non-alphabetical characters

EXAMPLES:
  pangram?("The quick brown fox jumps over the lazy dog.") == true
  pangram?("This is not a pangram.") == false

THOUGHTS:
  -Need to count each occurance of a-z in string
  -Need to iterate over each character in string
  -Use hash with a-z as keys and default 0 values

DATA STRUCTURES:
Hash (To hold occurances of a-z in string)

ALGORITHM:
  -Set string to downcase equivalent
  -Set letters hash with keys a-z and default 0 values
  -Iterate over each character in string
    -Increment count by 1 is character is a key in letters_hash
  -Return true if all values in letters_hash are greater than 1
  -Else return false 
=end

def pangram?(string)
  string = string.delete('^A-Za-z').downcase
  letters_hash = ('a'..'z').each_with_object({}) { |key, hash| hash[key] = 0 }

  string.each_char { |char| letters_hash[char] += 1 }

  letters_hash.values.all? { |count| count >= 1 }
end


#Alternate solution
def pangram?(string)
  string = string.delete('^a-zA-Z').downcase
  ('a'..'z').all? { |letter| string.include?(letter) }
end

# What we want to check is if ALL LETTERS are included in the string, so we
# should iterate over ALL LETTERS
# This will iterate over all letters and check if each letter is included in
# the string 

p pangram?("The quick brown fox jumps over the lazy dog.") == true
p pangram?("This is not a pangram.") == false



#Second attempt
=begin
A pangram is a sentence that contains every single letter of the alphabet at least once.  
For example: the sentence "The quick brown fox jumps over the lazy dog" is a pangram, 
because it uses the letters A-Z at least once (case is irrelevant).

Given a string, detect whether or not it is a pangram. Return True if it is, False if not. 
Ignore numbers and punctuation.

PROBLEM:
Take a string(input)
Return true if pangram, false otherwise(output)
Pangram: Sentence containing every letter of alphabet at least once
Case is irrelevant(Explicit Rule)
Ignore numbers and punctuation(Explicit Rule)

EXAMPLES:
('The quick brown fox jumps over the lazy dog.') => All letters appear at least once
('This is not a pangram.') => All letters don't appear at least once

DATA STRUCTURES:
Range(a..z)

THOUGHTS:

ALGORITHM:
Rationalize to input to all same case (lowercase)
Iterate letters a..z
  Return true if all letters have a count of 1 or more in string
  False otherwise

=end

def is_pangram(string)
  str = string.downcase
  ('a'..'z').all? { |char| str.count(char) >= 1 }
end

p is_pangram('The quick brown fox jumps over the lazy dog.') == true
p is_pangram('This is not a pangram.') == false
