=begin
PROBLEM: Take a string of integers and return the amount of substrings whose
integer equivalents equate to odd
-Input: String of integer elements
-Output: Integer represnting odd subtring integer equivalents
-Rules:
-Should I assume there will never be an empty input?

EXAMPLES:
  solve("1341") == 7
  solve("1357") == 10
  solve("13471") == 12
  solve("134721") == 13
  solve("1347231") == 20
  solve("13472315") == 28

THOUGHTS
-Move string elements to array for easy conversions
-Transform all elements to integers
-Select ones which are odd

DATA STRUCTURES:
Array (to hold all substrings for conversions)

ALGORITHM:
  GET ALL SUBSTRINGS
  - Set substring_array to empty array
  - Iterate from 0 upto string size minus 1 with outer index
    - Iterate from outer index upto string size minus 1 with inner index
      - Push string from outer index to inner index onto substring_array
  - Return substring_array

  TRANSFORM AND SELECT ELEMENTS
  - Iterate over every substring
    - Convert to integers
  - Iterate over converted substrings
    - Select elements which are odd
  - Sum elements in returned array

=end

def solve(string)
  substring_array = get_substrings(string)
  substring_array.map(&:to_i).select(&:odd?).size
end

def get_substrings(string)
  substring_array = []
  0.upto(string.size - 1) do |outer_idx|
    outer_idx.upto(string.size - 1) do |inner_idx|
      substring_array << string[outer_idx..inner_idx]
    end
  end
  substring_array
end


#Alternate solution
def solve(string)
  get_subnums(string).size
end

def get_subnums(string)
  subnum_array = []
  0.upto(string.size - 1) do |outer_idx|
    outer_idx.upto(string.size - 1) do |inner_idx|
      potential_num = string[outer_idx..inner_idx].to_i
      subnum_array << potential_num if potential_num.odd?
    end
  end
  subnum_array
end


p solve("1341") == 7
p solve("1357") == 10
p solve("13471") == 12
p solve("134721") == 13
p solve("1347231") == 20
p solve("13472315") == 28
