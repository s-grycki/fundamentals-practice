=begin
Write a function that takes in a string of one or more words, and returns the same string, 
but with all five or more letter words reversed (Just like the name of this Kata). 
Strings passed in will consist of only letters and spaces. Spaces will be included 
only when more than one word is present.
Examples: spinWords( "Hey fellow warriors" ) => returns "Hey wollef sroirraw"

PROBLEM:
Take a string of one or more words(input)
Return the same string, but with words of 5 or more letters reversed(output)
Strings will only consist of letters and spaces(Explicit Rule)
Spaces will deliminate words(Explicit Rule)
Return original string and not new string(Implicit Rule) - based on "same string"

EXAMPLES:

DATA STRUCTURES:
Input: String of space seperated words
Intermediate: Array of split elements
Output: Same string with size words 5 or more reversed

THOUGHTS:

ALGORITHM:
Split each word into array element and iterate over each word ["Hey, fellow, warriors"]
Destructively replace word in string with word reversed if word size is 5 or more (fellow)
Return SAME string ("Hey wollef sroirraw") 

=end

def spin_words(string)
  string.split.each do |word|
    string.sub!(word, word.reverse) if word.size >= 5
  end

  p string.object_id # Still same as object id outside method
  string
end

str = "Hey fellow warriors"
p str.object_id
p spin_words(str) == "Hey wollef sroirraw"

str = "This is a test"
p str.object_id
p spin_words(str) == "This is a test"

str = "This is another test"
p str.object_id
p spin_words(str) == "This is rehtona test"

str = "test"
p str.object_id
p spin_words(str) == "test"

# Note: String#split will create a new array object to iterate over, but it's never
# reassigned, so the string outside the method and the one passed to the method
# parameter still point to the same object in memory when performing a destructive action
