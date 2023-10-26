=begin
The goal of this exercise is to convert a string to a new string where each
character in the new string is "(" if that character appears only once in 
the original string, or ")" if that character appears more than once in 
the original string.

Ignore capitalization when determining if a character is a duplicate.

Examples
"din" => "((("
"recede" => "()()()"
"Success" => ")())())"
"(( @" => "))(("

PROBLEM:
Take a string of characters(Input)
Turn character into ( if it appears only once or ) if it appears more than once and
return this new string(Output)
Ignore case when determining occurances(Explicit Rule)
Input characters can be of any type - including spaces(Implicit Rule)

EXAMPLES:

DATA STRUCTURES:
Input: String of any characters
Intermediate: Array (Iterating over characters and applying transformation behavior)
Output: String with characters transformed to "(" or ")"
Helper: Hash with count of each character in string (possibility)

THOUGHTS:

ALGORITHM:
First pass:
Iterate over each character in string
Transform each character to ( or ) based on occurance count
Return as a new string

Second Pass:
Downcase all letters in string ("success")
Split input into an array of characters ([s,u,c,c,e,s,s])
Iterate over each character in array (s)
  If current character has count greater than one in downcased string (true)
    Return )
  Else (count of 1) (u)
    Return (
Return final array as a string [), (, ), ), (, ), )] => ")())())"

=end

def duplicate_encode(string)
  string = string.downcase
  string.chars.map { |char| string.count(char) > 1 ? ')' : '(' }.join
end

p duplicate_encode("din") == "(((" # All character appear only once
p duplicate_encode("recede") == "()()()"
p duplicate_encode("Success") == ")())())"
p duplicate_encode("(( @") == "))(("
