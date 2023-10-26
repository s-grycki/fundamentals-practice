=begin
Re-order the characters of a string, so that they are concatenated into a new 
string in "case-insensitively-alphabetical-order-of-appearance" order. 
Whitespace and punctuation shall simply be removed!

The input is restricted to contain no numerals and only words containing 
the english alphabet letters.



PROBLEM: Take a string of characters and rearange them into case-insensitive
alphabetical order based on order of appearance. Ignore non-alphabeticals

EXAMPLES:
alphabetized("cCbBaA") #== "AaBbCc"
alphabetized("The Holy Bible") == "BbeehHilloTy"
alphabetized("Gotta Catch e'm All!") #== "AaaCceGhllmottt"

THOUGHTS:
-Sort through an array of elements with non-alphabeticals removed
  -Sort as if case doesn't matter

DATA STRUCTURES:
Array

ALGORITHM:
-Delete non-alpahbeticals from string and split into array of characters
  -Sort each character in array case-insensitively
-Join back into string

=end

def alphabetized(string)
  string.delete('^a-zA-Z').chars.sort_by(&:downcase).join
end

p alphabetized("cCbBaA") == "aAbBcC"
p alphabetized("The Holy Bible") == "BbeehHilloTy"
p alphabetized("Gotta Catch e'm All!") == "aaACceGhllmottt"
