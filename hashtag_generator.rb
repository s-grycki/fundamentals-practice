=begin
The marketing team is spending way too much time typing in hashtags.
Let's help them with our own Hashtag Generator!
Here's the deal:
It must start with a hashtag (#).
All words must have their first letter capitalized.
If the final result is longer than 140 chars it must return false.
If the input or the result is an empty string it must return false.
Examples
" Hello there thanks for trying my Kata" => "#HelloThereThanksForTryingMyKata"
" Hello World " => "#HelloWorld"
"" => false

PROBLEM:
Complex string that may contain integers and concatenation(Input)
Boolean false if it doesn't meet explicit rule or a hastag string if all rules met(output)

Explicit Rules:
Must start with hashtag(#)
All words must have first letter capitalized
Final result must be under 140 character
If input is empty string, return false
If result is an empty string return false

Implicit Rules:
Add hashtag to output if all other rules met
Capitalize each first letter in word
Output wont have spaces, so don't count these
Hashtag counts for character limit

EXAMPLES:

DATA STRUCTURES:
Input: Complex string
Intermediate: Arrays(Capitalize each first letter, split according to spaces, add hashtag to first element)
Output: String or boolean

THOUGHTS:
Checking string size returns false for 4th to last test case
  Need to split into array elements first then check cumulative size of each element
  All spaces would return an empty array (which still works for 2nd test case)

ALGORITHM:
If input is empty or size is greater than or equal to 140 (hashtag adds extra character)
  Return false

Split string into array of elements deliminated by spaces [Do, We, have, A, Hashtag]
Transform each first character to uppercase [Do, We, Have, A, Hashtag]
Insert hashtag at beginning of first element [#Do, We, Have, A, Hashtag]
Join array back into string #DoWeHaveAHashtag (output)

=end

def generateHashtag(string)
  arr = string.split
  return false if arr.empty? || arr.reduce(0) { |accum, word| accum += word.size } >= 140

  arr.map(&:capitalize).unshift('#').join
end

p generateHashtag("") == false # empty input
p generateHashtag(" " * 200) == false # Output more than 140 characters / empty input
p generateHashtag("Do We have A Hashtag") == "#DoWeHaveAHashtag"
p generateHashtag("Codewars") == "#Codewars"
p generateHashtag("Codewars Is Nice") == "#CodewarsIsNice"
p generateHashtag("Codewars is nice") == "#CodewarsIsNice"
p generateHashtag("code" + " " * 140 + "wars") == "#CodeWars" # Spaces don't count for limit
p generateHashtag("Looooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong Cat") == false
p generateHashtag("a" * 139) == "#A" + "a" * 138 # First letter capitalized
p generateHashtag("a" * 140) == false # Adding the hashtag akes it 141
