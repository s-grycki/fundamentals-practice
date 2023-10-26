=begin
# Have the method letter_changes(str) take the str parameter being passed and
# modify it using the following algorithm. Replace every letter in the string
# with the 3rd letter following it in the alphabet (ie. c becomes f, Z becomes C).
# Then return this modified string.

p letter_changes("this long cake@&") == "wklv orqj fdnh@&"
p letter_changes("Road trip9") == "Urdg wuls9"
p letter_changes("EMAILZ@gmail.com") == "HPDLOC@jpdlo.frp"
p letter_changes('xyz') == ('abc')

PROBLEM: Take a string of characters, and if character is a letter replace it
with letter 3 after it
-Input: String of characters
-Output: String with every letter upped by 3 relative to alphabet
-Rules:
-Preserve case
-Leave non-letters alone
-Restart order if it goes past z

EXAMPLES:
p letter_changes("this long cake@&") == "wklv orqj fdnh@&"
p letter_changes("Road trip9") == "Urdg wuls9"
p letter_changes("EMAILZ@gmail.com") == "HPDLOC@jpdlo.frp"
p letter_changes('xyz') == ('abc')

THOUGHTS:
-Iterate over every character in string
-Need way to determine if character is a letter
-Need way to restart alphabet if it goes past z
  -Array rotate?

DATA STRUCTURE:
Arrays (to contain all possible upper/lowercase letters, to transform elements)

ALGORITHM:
-Set lowercase_chars to lowercase letter array
-Set uppercase_chars to uppercase letter array

-Iterate over every character in string as array element
  -If lowercase_chars includes character
    -Set idx to index at character in lowercase_chars
    -Get array starting at index through end and concat start through 1 less than index
      -Rotate this array 3 times and get first element
  -Else If uppercase_chars includes character
    -Set idx to index at character in uppercase_chars
    -Get array starting at index through end and concat start through 1 less than index
      -Rotate this array 3 times and get first element
  -Else
    -Return character
  -End

-Return transformed string


=end


def letter_changes(string)
  lowercase_chars = ('a'..'z').to_a
  uppercase_chars = ('A'..'Z').to_a

  string.chars.map do |char|
    if lowercase_chars.include?(char)
      idx = lowercase_chars.index(char)
      lowercase_chars[idx..-1].concat(lowercase_chars[0..idx -1]).rotate(3).first
    elsif uppercase_chars.include?(char)
      idx = uppercase_chars.index(char)
      uppercase_chars[idx..-1].concat(uppercase_chars[0..idx - 1]).rotate(3).first
    else
      char
    end
  end.join
  
end

p letter_changes("this long cake@&") == "wklv orqj fdnh@&"
p letter_changes("Road trip9") == "Urdg wuls9"
p letter_changes("EMAILZ@gmail.com") == "HPDLOC@jpdlo.frp"
p letter_changes('xyz') == ('abc')


#Alternate answer
def letter_changes(string)
  lowercase_chars = ('a'..'z').to_a
  uppercase_chars = ('A'..'Z').to_a

  string.chars.map do |char|
    if lowercase_chars.concat(uppercase_chars).include?(char)

      3.times do 
        if char == 'Z'
          char = 'A' 
        elsif char == 'z'
          char = 'a'
        else
          char = char.succ
        end
      end

    end

    char
  end.join
end


#Alternate answer
def letter_changes(string)
  upper = ('A'..'Z').to_a + ('A'..'C').to_a
  lower = ('a'..'z').to_a + ('a'..'c').to_a

  string.chars.map do |char|
    if upper.include?(char)
      index = upper.index(char)
      upper[index + 3]
    elsif lower.include?(char)
      index = lower.index(char)
      lower[index + 3]
    else
      char
    end
  end.join
end




def letter_changes(string)
  lowercase_chars = ('a'..'z').to_a
  uppercase_chars = ('A'..'Z').to_a

  string.chars.map do |char|
    if lowercase_chars.include?(char)
      index = lowercase_chars.index(char)
      lowercase_chars.rotate(3)[index]
    elsif uppercase_chars.include?(char)
      index = uppercase_chars.index(char)
      uppercase_chars.rotate(3)[index]
    else
      char
    end
  end.join

end

p letter_changes("this long cake@&") == "wklv orqj fdnh@&"
p letter_changes("Road trip9") == "Urdg wuls9"
p letter_changes("EMAILZ@gmail.com") == "HPDLOC@jpdlo.frp"
p letter_changes('xyz') == ('abc')
