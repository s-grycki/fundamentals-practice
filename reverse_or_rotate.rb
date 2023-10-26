=begin
Reverse or rotate?
The input is a string str of digits. Cut the string into chunks 
(a chunk here is a substring of the initial string) of size sz
(ignore the last chunk if its size is less than sz).
If a chunk represents an integer such as the sum of the cubes of its digits is 
divisible by 2, reverse that chunk; otherwise rotate it to the left by one position. 
Put together these modified chunks and return the result as a string.
If sz is <= 0 or if str is empty return ""
sz is greater (>) than the length of str it is impossible to take a chunk of size sz hence return "".
Examples:
revrot("123456987654", 6) --> "234561876549"
revrot("123456987653", 6) --> "234561356789"
revrot("66443875", 4) --> "44668753"
revrot("66443875", 8) --> "64438756"
revrot("664438769", 8) --> "67834466"
revrot("123456779", 8) --> "23456771"
revrot("", 8) --> ""
revrot("123456779", 0) --> ""
revrot("563000655734469485", 4) --> "0365065073456944"

PROBLEM:
Take a string of digits and integer as "sz"(Input)
Put together modified chunks and return as string(Output)

Explicit Rules:
Cube digits and sum them. If divisble by 2, reverse chunk in place
Else, rotate to left by 1 position
Cut string into substrings of size "sz"
If "sz" is greater than or equal to 0, or string is empty return ""
If sz is greater than than length of string, then return ""
Ignore last chunk if size is less than "sz" - as in don't return

Defintion of sz: size of current substring before rotating or reversing

Chunk represents integer => cube the digits and sum them and if divisible by 2, reverse chunk
If not divisble by 2, rotate to left by 1 position

EXAMPLES:
"733049910872815764" => 73304, 99108, 72815, 764. => false, false, false, drop
33047
91089
28157
330479108928157

"66443875" => 66443875 *slice is entire string

"123456987654" => 123456, 987654
234561
876549
234561876549

DATA STRUCTURES:
Input: String of digits, size parameter indicating slice sizes
Intermediate: An array of digits (for even/odd checking)
Output: Modified string of input based on even/odd conditions

THOUGHTS:
Want to mutate array of integers based on something else
  Use it for comparison, don't mutate one object

ALGORITHM:
Return "" if sz <= 0 or sz > string size or string is empty
Populate array of integers and filter out values less than sz
Get the cubed sums of all elements
Mutate the array of integers based on the corresponding values in cubed sums
Return as joined string


Get slices out of input using size parameter [["7", "3", "3", "0", "4"], ["9", "9", "1", "0", "8"], ["7", "2", "8", "1", "5"], ["7", "6", "4"]]
Convert each to integer [[7, 3, 3, 0, 4], ["9", "9", "1", "0", "8"], ["7", "2", "8", "1", "5"], ["7", "6", "4"]]
Filter out subarrays that aren't equal in size to size parameter

Set even_check to Cube each value and sum them

Iterate through each even_check
  If chunk is even
    Reverse correspong array element in place
  If check is odd
    Rotate first element to end in corresponding array

Join all elements back into a single string

=end


def revrot(string, sz)
  return "" if invalid_inputs?(string, sz)

  int_arr = get_int_arrays(string, sz)
  even_check = get_cubed_sums(int_arr)
  mutate_int_array!(int_arr, even_check).flatten.join
end

def invalid_inputs?(string, sz)
  sz <= 0 || sz > string.size || string.empty?
end

def get_int_arrays(string, sz)
  int_arr = string.chars.each_slice(sz).map { |arr| arr.map(&:to_i) }
  int_arr.select { |arr| arr.size == sz }
end

def get_cubed_sums(int_arr)
  int_arr.map do |arr| 
    arr.map { |int| int ** 3 }.sum
  end
end

def mutate_int_array!(int_arr, even_check)
  even_check.each_with_index do |int, idx|
    int.even? ? int_arr[idx].reverse! : int_arr[idx] << int_arr[idx].shift
  end

  int_arr
end

p revrot("1234", 0) == "" # sz is greater than or equal to 0
p revrot("", 0) == "" # sz is greater than or equal to 0 AND string is empty
p revrot("1234", 5) == "" # sz is greater than string size
p revrot("733049910872815764", 5) == "330479108928157"
p revrot("123456987654", 6) == "234561876549"
p revrot("123456987653", 6) == "234561356789"
p revrot("66443875", 4) == "44668753"
p revrot("66443875", 8) == "64438756"
p revrot("664438769", 8) == "67834466"
p revrot("123456779", 8) == "23456771"
p revrot("", 8) == "" # sz is greater than string size
p revrot("123456779", 0) == "" # sz is greater than or equal to 0
p revrot("563000655734469485", 4) == "0365065073456944"
