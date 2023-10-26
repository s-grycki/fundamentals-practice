=begin
In cryptography, a Caesar cipher, also known as Caesar’s cipher, 
the shift cipher, Caesar’s code or Caesar shift, is one of the simplest 
and most widely known encryption techniques. It is a type of substitution 
cipher in which each letter in the plaintext is replaced by a letter some 
fixed number of positions down the alphabet. 

For example, with a left shift of 3, D would be replaced by A, E would become B, and so on. 
The method is named after Julius Caesar, who used it in his private correspondence.

Implement a caesar cipher that takes in a string and the shift factor and 
then outputs the modified string:

PROBLEM:
Take a string of characters(input)
Return a string with each character shifted up 5 in the alphabet(output)
Ignore non-alphabetics(Implicit Rule)

EXAMPLES:
"What a string!" => B,m,f,y f x,y,w,n,s,l,!

DATA STRUCTURES:
Array(Iterating over collection of elements)

THOUGHTS:
How do we define "up by 5"?
Up by 5 in alphabet order and turning over at z while maintaining case
Array for impicit conversions (each case)

ALGORITHM:
Transform each letter in string up 5 in alphabet order
Return non-letters as they are
Return as a new string

Set lower_arr to array of lowercase letters
Set upper_arr to array of uppercase letters

Iterate over an array of characters (W, h, a, t, ' ', a, ' ', s, t, r, i, n, g, !)
  If character is uppercase 'W'
    Set idx at index of character in upper_arr 22
      Loop 5 times
        idx equals idx plus 1 23,24,25,26=>0,1
        reset to 0 if idx equals 26
      Return char from upper_arr at idx after looping

  If character is lowercase
    Set idx at index of character in lower_arr
      Loop 5 times
        idx equals idx plus 1
        reset to 0 if idx equals 26
      Return char from lower_arr at idx after looping
  
  Else if character is not letter
    Return character
  End conditional

Return array of transformed elements as a string

=end

def caesar_cipher(string, integer)
  lower_arr = ('a'..'z').to_a
  upper_arr = ('A'..'Z').to_a

  string.chars.map do |char|
    if upper_arr.include?(char)
      idx = upper_arr.index(char)
      5.times do
        idx += 1
        idx = 0 if idx == 26
      end
      upper_arr[idx]

    elsif lower_arr.include?(char)
      idx = lower_arr.index(char)
      5.times do
        idx += 1
        idx = 0 if idx == 26
      end
      lower_arr[idx]

    else
      char
    end

  end.join
end


p caesar_cipher("What a string!", 5) == "Bmfy f xywnsl!"





#Refactored using rotate
def caesar_cipher(string, integer)
  lower_arr = ('a'..'z').to_a
  upper_arr = ('A'..'Z').to_a

  string.chars.map do |char|
    if upper_arr.include?(char)
      index = upper_arr.index(char)
      upper_arr.rotate(integer)[index]
    elsif lower_arr.include?(char)
      index = lower_arr.index(char)
      lower_arr.rotate(integer)[index]
    else
      char
    end
  end.join
end

p caesar_cipher("What a string!", 5) == "Bmfy f xywnsl!"
