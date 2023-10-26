=begin
Given two arrays of strings a1 and a2 return a sorted array r in lexicographical 
order of the strings of a1 which are substrings of strings of a2.
#Example 1: a1 = ["arp", "live", "strong"]
a2 = ["lively", "alive", "harp", "sharp", "armstrong"]
returns ["arp", "live", "strong"]
#Example 2: a1 = ["tarp", "mice", "bull"]
a2 = ["lively", "alive", "harp", "sharp", "armstrong"]
returns []
Notes:
Arrays are written in "general" notation. See "Your Test Cases" for examples in your language.
In Shell bash a1 and a2 are strings. The return is a string where words are separated by commas.
Beware: r must be without duplicates.
Don't mutate the inputs.

sorted_substrings(["arp", "live", "strong"], ["lively", "alive", "harp", "sharp", "armstrong"]) == ["arp", "live", "strong"]
sorted_substrings(["tarp", "mice", "bull"], ["lively", "alive", "harp", "sharp", "armstrong"]) == []

PROBLEM:
Take two arrays of strings(Input)
Return sorted array in "lexicographical" order where strings in array 1 are substrings found in array2(Output)
Don't mutate inputs(Explicit Rule)
Return empty array if no substrings found(Implicit Rule)
Lexicographical: Alphabetical order

Strings in array 1 are substrings found in array 2

EXAMPLES:
(["arp", "live", "strong"], ["lively", "alive", "harp", "sharp", "armstrong"])
"arp" => (h)arp, (sh),arp
"live" => live(ly), (a)live
"strong" => (arm)strong

DATA STRUCTURES:
Input: Two arrays of strings (array 1 is substrings to be found in strings of array2)
Intermediate: Array or substrings to be reset on iterations
Output: Array containing all array 1 elements found as substrings in array 2
Helper: Maybe new array containing all possible substrings from array2

THOUGHTS:

ALGORITHM:
First pass:
Get all possible substrings from all string elements in array2
Iterate over each element in array1
  If current string is included in all possible substrings
    Push to new array
Return new array

Second pass:
All possible substrings:
Set all_substrings to empty array
Iterate over every element in array2 ("lively", "alive", "harp", "sharp", "armstrong")
  Iterate from string index 0 upto 1 mnus string length (outer index) (0), (1)
    Iterate from outer index upto 1 minus string length (inner index) (0,1,2,3,4,5), (1,2,3,4,5) ...
      Push string at outer index through inner index onto all_substrings

Iterate over each element in array 1 ("arp", "live", "strong")
  Select elements included in all_substrings ("arp", "live", "strong")
Return as new array (output)

=end

def sorted_substrings(array1, array2)
  all_substrings = get_all_substrings(array2)
  array1.select { |str| all_substrings.include?(str) }
end

def get_all_substrings(array2)
  all_substrings = []

  array2.each do |string|
    0.upto(string.size - 1) do |outer_idx|
      outer_idx.upto(string.size - 1) do |inner_idx|
        all_substrings << string[outer_idx..inner_idx]
      end
    end
  end
  
  all_substrings
end

p sorted_substrings(["arp", "live", "strong"], ["lively", "alive", "harp", "sharp", "armstrong"]) == ["arp", "live", "strong"]
p sorted_substrings(["tarp", "mice", "bull"], ["lively", "alive", "harp", "sharp", "armstrong"]) == []
