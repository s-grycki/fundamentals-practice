=begin
A string is considered to be in title case if each word in the string is either
(a) capitalised (that is, only the first letter of the word is in upper case) 
or (b) considered to be an exception and put entirely into lower case 
unless it is the first word, which is always capitalised.

Write a function that will convert a string into title case, given an optional 
list of exceptions (minor words). The list of minor words will be given as a 
string with each word separated by a space. Your function should ignore the case of the
minor words string -- it should behave in the same way even if the case of the 
minor word string is changed.

PROBLEM:
Take a string as a title, and a list of exception words(input)
Return a new string with every word capitalized, except for the exception words(Output)
Always capitalize first word(Explicit Rule)
Ignore exception words - unless it's first word(Explicit Rule)
Second argument of exceptions is optional(Implicit Rule)

Definition: Title case is every word being capitalized, or put entirely into
lowercase unless it's the first word, which is always capitalized

EXAMPLES:
a => A, clash => Clash, of => of, KINGS => Kings ('A Clash of Kings')

DATA STRUCTURES:
Input: A string title, A list of exceptions words as a string (optional)
Intermediate: Array(Perform conditional transformations on words)
Output: A string in title case

THOUGHTS:
Exception words can be in different case than title words

ALGORITHM:
Give second parameter in function a default parameter of empty string
Rationalize both inputs to same case

Iterate through an array of words from title with index [a, clash, of, KINGS], (0)
  If index is 0
    Capitalize word 'A'
  Else if current word is an exception word
    downcase entire word 'of'
  Else
    Capitalize word 'Clash', 'Kings'
Return array as string seperated by spaces

=end

def title_case(title, exceptions = '')
  title = title.downcase
  exceptions = exceptions.downcase

  title.split.map.with_index do |word, idx|
    if idx == 0
      word.capitalize
    elsif exceptions.split.any? { |exception| exception == word }
      word.downcase
    else
      word.capitalize
    end
  end.join(' ')
end


# Refactored solution
def title_case(title, exceptions = '')
  title, exceptions = title.downcase, exceptions.downcase

  title.split.map.with_index do |word, idx|
    if idx == 0 || exceptions.split.none? { |exception| exception == word }
      word.capitalize
    else
      word.downcase
    end
  end.join(' ')
end



p title_case('a clash of KINGS', 'a an the of') == 'A Clash of Kings'
p title_case('THE WIND IN THE WILLOWS', 'The In') == 'The Wind in the Willows'
p title_case('the quick brown fox') == 'The Quick Brown Fox'
