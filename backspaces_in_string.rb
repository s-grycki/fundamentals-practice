=begin
Assume "#" is like a backspace in string. This means that string "a#bc#d" actually is "bd"
Your task is to process a string with "#" symbols.
Examples
"abc#d##c" ==> "ac"
"abc##d######" ==> ""
"#######" ==> ""
"" ==> ""

PROBLEM:
Take a string with characters and # symbols(Input)
Return a new string where # behaves like a backspace(Output)

EXAMPLES:
'abc#d##c' => abc, # => ab => abd => ab => a => ac
'abc####d##c#' => abc => ab => a => '' => '' => d => '' => '' => c => ''

DATA STRUCTURES:
Input: String of characters and hash signs
Intermediate: Array(to push and delete from while iterating)
Output: String with some or all characters deleted
Helper: -

THOUGHTS:

ALGORITHM:
Iterate over each character in string
If current character isn't hash(#)
  Push character to new array
Else
  Delete last character from new array
Return remaining characters as a string

=end

def clean_string(string)
  string.chars.each_with_object([]) do |char, arr|
    char == '#' ? arr.pop : arr.push(char)
  end.join
end

p clean_string('abc#d##c') == "ac"
p clean_string('abc####d##c#') == ""
