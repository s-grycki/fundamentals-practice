=begin
Given a string, return a new string that has transformed based on the input:
Change case of every character, ie. lower case to upper case, upper case to lower case.
Reverse the order of words from the input.
Note: You will have to handle multiple spaces, and leading/trailing spaces.
For example:
"Example Input" ==> "iNPUT eXAMPLE"
You may assume the input only contain English alphabet and spaces.



PROBLEM:
Take a string(Input)
Return new string transformed based on input(Output)
Change case of every character(Explicit Rule)
Reverse order of words(Explicit Rule)
Handle multiple spaces and leading/trailing spaces(Explicit Rule)
Assume input will only be English alphabet and spaces(EWplicit Rule)


EXAMPLES:
"Example Input" => "eXAMPLE iNPUT" => "iNPUT eXAMPLE"

DATA STRUCTURES:
Input: String of words and spaces (new word begins with at least one space)
Intermediate: Array with space and string elements (need to preserve spaces)
Output: String with swapcase on each character and word order reversed
Helper: -

THOUGHTS:

ALGORITHM:
Split string into array into elements of strings and spaces ["Example", " ", "Input"]
Iterate over each array element ("Example", " ", "Input")
  Iterate over each character (E,x,a,m,p,l,e), (" "), "I,n,p,u,t")
    Return the swapped case of each characer (e,X,A,M,P,L,E), (" "), (i,N,P,U,T)
Return as new array ["eXAMPLE", " ", "iNPUT"]
Reverse order of array ["iNPUT", " ", "eXAMPLE"]
Join back into string with all spaces preserved (output)

=end

def transform_string(string)
  string.split(/( )/).map do |elem|
    elem.chars.map(&:swapcase).join
  end.reverse.join
end

p transform_string("Example Input") == "iNPUT eXAMPLE"
p transform_string("  ToO    ManY       SPAces ") == " spaCES       mANy    tOo  "
