=begin
Implement a method #substrings that takes a word as the first argument 
and then an array of valid substrings (your dictionary) as the second 
argument. It should return a hash listing each substring (case insensitive) 
that was found in the original string and how many times it was found.

PROBLEM:
Take a word as a string and an array if valid substrings as second argument(input)
Return a hash listing each substring and how many times it was found in original string(output)
Be case-insensitive(Explicit Rule)

EXAMPLES:
(b,e,l,o,w), (be,el,lo,ow), (bel,elo,low), (belo, elow), (below)
"below" => "below", "low"

DATA STRUCUTRES:
Array(store all possible substrings from input)

THOUGHTS:

ALGORITHM:
Get all possible substrings from string input
Iterate over each substring and see if it's included in dictionary
  If so, then add substring with count incrementing by 1 onto new hash
Return new hash

Set sub_str to empty array
Iterate from 1 up to the size of the string (int) (1), (2)
  Get int consecutive characters and push onto substr_arr (b, e, l, o, w), (be,el,lo,ow)

Iterate over each substring in substr_arr with a new hash having 0 default value
  If current substring is included in dictionary (low), (elow)
    Set hash to substring key and increment by 1 (low => 1)
  Else (elow)
    Return hash (low => 1)
Return hash


=end

def substrings(string, dictionary)
  substr_arr = []
  1.upto(string.size) do |int|
    string.downcase.chars.each_cons(int) { |arr| substr_arr << arr.join }
  end
  
  substr_arr.reduce(Hash.new(0)) do |hash, substr|
    hash[substr] += 1 if dictionary.include?(substr)
    hash
  end
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
p substrings("below", dictionary) == { "below" => 1, "low" => 1 }

p substrings("Howdy partner, sit down! How's it going?", dictionary) == { "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 }

