=begin
Given an integer n, find the maximal number you can obtain by deleting exactly 
one digit of the given number.

PROBLEM: Take an integer of digits and return the maximum digit you can get by
deleting exactly one integer

EXAMPLES:
delete_digit(791983) == 91983
delete_digit(152) == 52
delete_digit(1001) == 101
delete_digit(10) == 1

THOUGHTS:
-Iterate over each digit and create a variable
  -Reassign variable if next digit is smaller
-Delete acquired number from array of digits

-Delete an integer so that beginning integer is as high as possible
  -Get largest digit
    -Delete element before it (starting at index 1)


DATA STRUCUTRES:
Array(to contain digits from integer)

ALGOIRTHM:
-Set min_digit to 9
-Set digit_array to array of integer digits
-Iterate over array of digits
  -Reassign min_digit if current digit is smaller
-Delete min_digit from array of digits
-Join back into string then convert back to integer


-Set digit_array to array of integer digits
-Set max_digit to max of digit_array
-Iterate over each digit with index
  -Next if index == 0
  -Delete element at index - 1 when digit == max_digit
-Return as integer
-Delete min digit if still equals input (biggest digit is only at index 0)
=end

def delete_digit(integer)
  digit_array = integer.digits.reverse
  max_digit = digit_array.max

  digit_array.each_with_index do |int, idx|
    next if idx == 0
    if int == max_digit
      digit_array.delete_at(idx - 1)
      break
    end
  end

  output = digit_array.join.to_i
  digit_array.delete(digit_array.min) if output == integer
  digit_array.join.to_i
end

#p delete_digit(791983) == 91983
#p delete_digit(152) == 52
#p delete_digit(1001) == 101
#p delete_digit(10) == 1




#Second attempt
=begin
Given an integer n, find the maximal number you can obtain by deleting exactly 
one digit of the given number.

delete_digit(791983) == 91983
delete_digit(152) == 52
delete_digit(1001) == 101
delete_digit(10) == 1

PROBLEM: Get the maximum number from an integer of digits with one digit removed

EXAMPLES:
delete_digit(791983) == 91983
delete_digit(152) == 52
delete_digit(1001) == 101
delete_digit(10) == 1

THOUGHTS:
-Need to get all possible integers with one digit removed
  -Could store these values in an array and get max
-Don't want to mutate object as we're iterating over it (slicing or cloning)

DATA STRUCTURES:
Array(to contain all possible integers with one digit removed)

ALGORITHM:
-Set vals_arr to empty array
-Iterate over each digit as an array element with an index
  -Push all digits minus current index onto vals_arr
    -Convert elements back to full integer before pushing
-Get max from vals_arr

-idx + 1..-1 (index 0)
-(0..idx - 1) + (idx + 1..-1)
-0..-2 (index == arr size minus 1)

=end

def delete_digit(integer)
  vals_arr = []
  digits_arr = integer.digits.reverse
  digits_arr.each_with_index do |int, idx|
    if idx == 0
      vals_arr << digits_arr[1..-1].join.to_i
    elsif idx == digits_arr.size - 1
      vals_arr << digits_arr[0..-2].join.to_i
    else
      vals_arr << (digits_arr[0..idx - 1] + digits_arr[idx + 1..-1]).join.to_i
    end
  end
  vals_arr.max
end

#Alternate other student solution
def delete_digit(integer)
  size = integer.to_s.size
  digits = integer.digits.reverse

  possibles = (0...size).map do |index|
    digits.select.with_index { |digit, idx| idx != index }
  end

  possibles.map(&:join).map(&:to_i).sort.last
end

#p delete_digit(791983) == 91983
#p delete_digit(152) == 52
#p delete_digit(1001) == 101
#p delete_digit(10) == 1


#Third attempt
=begin
Given an integer n, find the maximal number you can obtain by deleting exactly 
one digit of the given number.

EXAMPLES:
(791983) => [7, 9, 1, 9, 8, 3] => [9, 1, 9, 8, 3] => 71983 => 79983 => 79183 => 79193 => 79198
=> get max out of array and return

THOUGHTS:
-Split integer into array of digits
-Create copy of array
-Iterate over each element with an index and delete index from array
  -Push copy array onto new array as integer
  -Reset copy array on each iteration
-Get max out of new array

DATA STRUCTURES:
Arrays (for digits, and to contain possible integers)

ALGORITHM:
-Set copy_arr to array of digits [7, 9, 1, 9, 8, 3]
-Set possibles to empty array []

-Iterate over each digit with an index (7, 0)
  -Delete from copy array at index [7, 9, 1, 9, 8, 3].delete_at(0)
  -Push copy_arr as integer onto possibles (91983)
  -Reset copy_arr [7, 9, 1, 9, 8, 3]
-Return max from possibles

=end

def delete_digit(integer)
  copy_arr = integer.digits.reverse
  possibles = []

  integer.digits.reverse.each_with_index do |_, idx|
    copy_arr.delete_at(idx)
    possibles << copy_arr.join.to_i
    copy_arr = integer.digits.reverse
  end

  possibles.max
end

#Alternate solution
def delete_digit(integer)
  (0...integer.to_s.size).map do |index|
    integer.digits.reverse.reject.with_index { |digit, idx| idx == index }
  end.map(&:join).map(&:to_i).sort.last
end

p delete_digit(791983) == 91983
p delete_digit(152) == 52
p delete_digit(1001) == 101
p delete_digit(10) == 1
