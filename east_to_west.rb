=begin
You will be given an array of string `"east"` formatted differently every time. 
Write a method that returns `"west"` wherever there is `"east"`. 
Format the string according to the input.

The input will only be `"east"` in different formats.

PROBLEM: Take an array of strings, which all say east, in different formats, and
return west in the same format
Input: Array of strings east formated differently
Output: Array of strings west formated same as corresponding input
-Rules:
-Input will always be east

EXAMPLES:
p direction(["east", "EAST", "eastEAST"]) == ["west", "WEST", "westWEST"]
p direction(["eAsT EaSt", "EaSt eAsT"]) == ["wEsT WeSt", "WeSt wEsT"]
p direction(["east EAST", "e a s t", "E A S T"]) == ["west WEST", "w e s t", "W E S T"]

THOUGHTS:
-Transformation behavior
-Iterate over every character and convert to different letter (e -> w: hash)
  -Need to preserve format (check if character is uppercase or lowercase)

DATA STRUCTURES:
Hash(character conversion), Array(transformation behavior)

ALGORITHM:
-Set conversion_hash to upper/lowercase conversions (e => w)
-Iterate over each string in input array
  -Iterate over each string as an array of characters
    -Convert based on hash given if it's a key
      -Else return character
  -Return elements as strings
-Return as single array of strings

=end

def direction(array)
  conversion_hash = {'e' => 'w', 'a' => 'e', 'E' => 'W', 'A' => 'E'}
  array.map do |word|
    word.chars.map do |char|
      conversion_hash.key?(char) ? conversion_hash[char] : char
    end.join
  end
end


def direction(phrase_arr)
  phrase_arr.map do |phrase|
    phrase.gsub('e', 'w').gsub('E', 'W').gsub('a', 'e').gsub('A', 'E')
  end
end

def direction(phrase_arr)
  phrase_arr.map { |phrase| phrase.tr('eEaA', 'wWeE') }
end


p direction(["east", "EAST", "eastEAST"]) == ["west", "WEST", "westWEST"]
p direction(["eAsT EaSt", "EaSt eAsT"]) == ["wEsT WeSt", "WeSt wEsT"]
p direction(["east EAST", "e a s t", "E A S T"]) == ["west WEST", "w e s t", "W E S T"]
