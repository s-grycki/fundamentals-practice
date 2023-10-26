=begin
Move the first letter of each word to the end of it, then add "ay" to the 
end of the word. Leave punctuation marks untouched

pigIt('Pig latin is cool') == 'igPay atinlay siay oolcay'
pigIt('Hello world !') == 'elloHay orldway !'

PROBLEM: Take a string of words and push the first letter to the end of
each word, then add "ay". Punctutation marks should be left alone

THOUGHTS:
-Split into array elements
-Transform if word includes letters
  -Else return self

DATA STRUCTURES:
Array

ALGORITHM:
-Iterate over array of word elements
  -Transform if word contains valid letters
    -Delete first element from each word and push it to end, and push ay to end
  -Return word otherwise
-Return as a string

=end

# String#delete returns new string with characters removed
# Array#delete returns the deleted object
def pigIt(string)
  valid_chars = ('A'..'Z').to_a + ('a'..'z').to_a

  string.split.map do |word|
    if word.chars.any? { |char| valid_chars.include?(char) }
      word.delete(word[0]) + word[0] + 'ay'
    else
      word
    end
  end.join(' ')
end

p pigIt('Pig latin is cool') == 'igPay atinlay siay oolcay'
p pigIt('Hello world !') == 'elloHay orldway !'
