=begin
Sort the given strings in alphabetical order, case insensitive. For example:
["Hello", "there", "I'm", "fine"] --> ["fine", "Hello", "I'm", "there"]
["C", "d", "a", "B"]) --> ["a", "B", "C", "d"]

PROBLEM:
Take an array of strings(Input)
Return them sorted in alphabetical order(output)
Be case-insensitive with sorting(Explicit Requirement)
Sorting strings(Implicit Requirement)
Sort uppercase first if a lowercase equivalent appears(Implicit Requirement)
Return self if only one string(Implicit Requirement)
Able to assume first character of each word is a letter(Implicit Requirement)

EXAMPLES:

DATA STRUCTURES:
Input: Array of strings (upper/lowercase mixed)
Intermediate: -
Output: Array with same elements sorted alphabetically
Helper: Array of all letters in alphabetical order (AaBbCc)

THOUGHTS:
Accessing individual strings
Want to sort using first letter in string H
Want to pass an index to all_letters array all_letters[(all_letters.index(H))]


ALGORITHM:
Set all_letters to array of uppercase letters combined with lowercase letters [AaBbCc]
Iterate over every string in the input array
  Sort each string according to order of all_letters array
Return sorted array

Sort each string according to order of all_letters array


=end

def sortme(array)
  all_letters = (('A'..'Z').to_a.zip('a'..'z').to_a).flatten
  array.sort_by { |string| all_letters.index(string[0]) }
end

p sortme(["Hello", "there", "I'm", "fine"]) == ["fine", "Hello", "I'm", "there"]
p sortme(["C", "d", "a", "Ba", "be"]) == ["a", "Ba", "be", "C", "d"]
p sortme(["CodeWars"]) == ["CodeWars"]
