=begin
Given a string of words, you need to find the highest scoring word.
Each letter of a word scores points according to its position in the alphabet: 
a = 1, b = 2, c = 3 etc.
You need to return the highest scoring word as a string.
If two words score the same, return the word that appears earliest in the original string.
All letters will be lowercase and all inputs will be valid.

PROBLEM: Take a string of words and return the word which scores the higest relative
to each letter's position the alphabet. Return first word if 2 words score the same.
Assume all lowercase and valid letters

EXAMPLES:
'man i need a taxi up to ubud' (20, 1, 24, 9).sum #get max_by

THOUGHTS:
-Get max_by transforming each letter in each word to an integer and summing them
-Use hash for value conversions ('a' => 1)

DATA STRUCUTRES:
Array(transformation behavior on string), Hash(value conversions)

ALGORITHM:
-Set val_convert to hash with a..z keys and 1..26 values
-Split string into array elements and get max by transformation of each character summed

'aaa b' => ['aaa', 'b'] => [1,1,1].sum => 3, [2].sum => 2 => 'aaa'

=end

def high(str)
  val_convert = (('a'..'z').to_a).zip((1..26).to_a).to_h

  str.split.max_by do |word| 
    word.chars.map{ |char| val_convert[char] }.sum
  end
end

p high('man i need a taxi up to ubud') == 'taxi'
p high('what time are we climbing up the volcano') == 'volcano'
p high('take me to semynak') == 'semynak'
p high('aaa b') == 'aaa'
