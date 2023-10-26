=begin

You have to create a method that takes a positive integer number and returns 
the next bigger number formed by the same digits. 
examples: 
12 --> 21 
513 --> 531
2017 --> 2071
If no bigger number can be formed using these digits, return -1. 
examples: 
9 --> -1
111 --> -1
531 --> -1

PROBLEM:
Take an integer and return the next biggest that can be formed from the same digits.
If no bigger number can be formed, return -1

EXAMPLES:
*Each digit sorted in decending order equals digit (return -1)
(12) => [1, 2] => Current is greater than previous. Reverse them => [2, 1] => 21
(123456789) => [1, 2, 3, 4, 5, 6, 7, 8, 9] => arr[-1] > arr[-2]. Reverse them =>
123456798

THOUGHTS:
-Guard clause for -1 logic
-Iterate an array of digits starting at end and going to first
  -Check if current element is greater than next back
    -If so, swap values and return as digit

DATA STRUCUTRES:
Array(digits)

ALGORITHM:
-Set arr_digits to array of digits
-Return -1 if arr_digits sorted in decending == arr_digits [5, 3, 1] == [5, 3, 1]
-Iterate over each digit in arr_digits with index(1) [2, 0, 7, 1]
  -If arr[-idx] > arr[-idx - 1] 1 > 7, 7 > 0
    -arr[-idx], arr[-idx - 1] = arr[-idx - 1], arr[-idx] 7,0 = 0,7
-Return arr_digits as string then integer

=end

def next_bigger(integer)
  arr_digits = integer.digits.reverse
  return -1 if arr_digits.sort{ |a,b| b <=> a } == arr_digits

  arr_digits.each.with_index(1) do |int, idx|
    if arr_digits[-idx] > arr_digits[-idx - 1]
      arr_digits[-idx], arr_digits[-idx - 1] = arr_digits[-idx - 1], arr_digits[-idx]
      break
    end
  end

  arr_digits.join.to_i
end

p next_bigger(9) == -1
p next_bigger(12) == 21
p next_bigger(513) == 531
p next_bigger(2017) == 2071
p next_bigger(111) == -1
p next_bigger(531) == -1
p next_bigger(123456789) == 123456798
p next_bigger(128349567) == 128349576
