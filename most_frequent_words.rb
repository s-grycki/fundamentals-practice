=begin
Write a function that, given a string of text (possibly with punctuation and line-breaks), 
returns an array of the top-3 most occurring words, in descending order of the number 
of occurrences.
Assumptions:
A word is a string of letters (A to Z) optionally containing one or more apostrophes (') in ASCII. 
(No need to handle fancy punctuation.)
Matches should be case-insensitive, and the words in the result should be lowercased.
Ties may be broken arbitrarily.
If a text contains fewer than three unique words, then either the top-2 or top-1 
words should be returned, or an empty array if a text contains no words.
Examples:
top_3_words("In a village of La Mancha, the name of which I have no desire to call to
mind, there lived not long since one of those gentlemen that keep a lance
in the lance-rack, an old buckler, a lean hack, and a greyhound for
coursing. An olla of rather more beef than mutton, a salad on most
nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
on Sundays, made away with three-quarters of his income.")
# => ["a", "of", "on"]
top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e")
# => ["e", "ddd", "aa"]
top_3_words(" //wont won't won't")
# => ["won't", "wont"]

PROBLEM:
Take a string of text - possibly with punctuation and line-breaks(Input)
Return array with 3 most occuring words in decending order(Output)

A word is defined as a string of letters which may contain apostrophes(Explicit Rule)
Matches should be case-insensitive and maintain this with output(Explicit Rule)
If text contains fewer than 3 unique words, return top 2/1(Explicit Rule)
Return an empty array if there are no valid words(Explicit Rule)

Words are seperated by spaces(Implicit Rule)
Non-apostrophes are invalud punctuation(Implicit Rule)
Apostrophes aren't valid words without letters(Implicit Rule)

EXAMPLES:
(" //wont won't won't ") => (" ", wont won't won't ") *Spaces aren't valid words
=> won't, wont
(" , e .. ") => (" ,", "e", "..", " ") *Only elements with letters are valud
=> e

DATA STRUCTURES:
Input: String of space seperated words
Intermediate: Array with elements split by spaces and non-apostrophe/letter characters deleted
Output: Array with top 3 occuring valid words (decending order)
Helper: Hash as tally of valid word occurances

THOUGHTS:

ALGORITHM:
First pass:
Rationalize input
Split into array of words
Delete invalid elements from array
Get max 3 out of array by occurance

Second pass:
Downcase input ("e e e e ddd ddd ddd: ddd ddd aa aa aa, bb cc cc e e e")
Delete everything that isn't a lowercase letter, apostrophe, or space (" wont won't won't ")
Split into array by spaces (["wont", "won't", "won't"]), (["'"])
Delete elements which are only apostrophes  (["'"]) => ([])
Get hash with characters as keys and occurances as values {"a"=>3, "b"=>1, "c"=>2, "d"=>4, "e"=>5}
Get max 3 keys out of hash by value ([["e", 5], ["d", 4], ["a", 3]])
Return first elements out of each subarray in same order

=end

def top_3_words(string)
  str_arr = string.downcase.delete("^a-z '").split

  str_arr = str_arr.reject do |elem| 
    elem.chars.all? { |char| char == "'" }
  end
  
  str_arr.tally.max_by(3) { |k,v| v }.map { |k,_| k }
end

p top_3_words("a a a b c c d d d d e e e e e") == ["e", "d", "a"]
p top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e") == ["e", "ddd", "aa"]
p top_3_words(" //wont won't won't ") == ["won't", "wont"]
p top_3_words(" , e .. ") == ["e"]
p top_3_words(" ... ") == []
p top_3_words(" ' ") == []
p top_3_words(" ''' ") == []
p top_3_words("""In a village of La Mancha, the name of which I have no desire to call to
mind, there lived not long since one of those gentlemen that keep a lance
in the lance-rack, an old buckler, a lean hack, and a greyhound for
coursing. An olla of rather more beef than mutton, a salad on most
nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
on Sundays, made away with three-quarters of his income.""") == ["a", "of", "on"]
