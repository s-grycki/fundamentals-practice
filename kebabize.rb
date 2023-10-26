=begin
Modify the kebabize function so that it converts a camel case string into a kebab case.
kebabize('camelsHaveThreeHumps') // camels-have-three-humps
kebabize('camelsHave3Humps') // camels-have-humps
Notes:
the returned string should only contain lowercase letters

PROBLEM:
Take a camel case string(input)
Return string in kebab-case(output)
Returned string should only have lowercase letters(Explicit Rule)
Kebab case: String seperated by dashes. Camel case word seperation is defined by
capital letters(Definition)
First word in camel case will not be capitalized(Implicit Rule)


EXAMPLES:
my, Camel, Cased, String => 'my-camel-cased-string'
my, Camel, Has, 3, Humps => my, Camel, Has, Humps => 'my-camel-has-humps'

DATA STRUCTURES:
Input: Camel case string
Intermediate: Array representing words with non-letter characters deleted
Output: Kebab case string
Helper: Array of all letters (more convenient to delete non-letters as string)

THOUGHTS:
Could split into array of elements with capital letter preserved
Need to join element 1 with element 2, 3 with 4, and so on
Current element is all upcase and next is all downcase then group them


ALGORITHM:
Delete non-letters out of input "myCamelHasHumps"
Split string into array according to capitals while preserving them ["my", "C", "amel", "C", "ased", "S", "tring"]

Compare current with next element and check if current is upcase and next is downcase
  Group them if so [["my"], ["C", "amel"], ["C", "ased"], ["S", "tring"]]

Join all subarrays into string elements ["my", "Camel", "Cased", "String"]

Join back as string with dashes between elements "my-Camel-Cased-String"

Downcase the output "my-camel-cased-string"

=end

def kebabize(string)
  string = string.delete('^A-Za-z')

  string.split(/([A-Z])/).chunk_while do |cur, nex| 
    cur.upcase == cur && nex.downcase == nex 
  end.map(&:join).join('-').downcase
end

# More manual approach. Uses custom index to increment twice if inserting a new character
def kebabize(string)
  string = string.delete('^A-Za-z')
  idx = 0

  string.each_char do |char|
    if char.upcase == char
      string.insert(idx, '-')
      idx += 2
    else
      idx += 1
    end
  end

  string.downcase
end

p kebabize('myCamelCasedString') == 'my-camel-cased-string'
p kebabize('myCamelHas3Humps') == 'my-camel-has-humps'
