=begin
Write a function, persistence, that takes in a positive parameter num and 
returns its multiplicative persistence, which is the number of times you 
must multiply the digits in num until you reach a single digit.
For example:
persistence(39) # returns 3, because 3*9=27, 2*7=14, 1*4=4
# and 4 has only one digit
persistence(999) # returns 4, because 9*9*9=729, 7*2*9=126,
# 1*2*6=12, and finally 1*2=2
persistence(4) # returns 0, because 4 is already a one-digit number

PROBLEM:
Take a positive integer(Input)
Number of times it takes to reach a single digit(Output)

Multiplicative persistence: Number of times you need to multiply the digits of input
until you reach a single digit

EXAMPLES:
39 => 3 * 9 == 27, 2 * 7 == 14, 1 * 4 == 4 (single digit - took 3 times)
25 => 2 * 5 == 10 => 1 * 0 => 1 (2 times)
999 => 9 * 9 * 9 = 729, 7 * 2 * 9 == 126, 1 * 2 * 6 == 12, 1 * 2 == 2 (4 times)

DATA STRUCTURES:
Input: Positive integer
Intermediate: Array (to seperate out digits)
Output: Positive integer or 0 depending on how many digit multiplications were performed
Helper: -

THOUGHTS:

ALGORITHM:
First pass:
Return 0 if only 1 digit in input
Set counter to  0
Until there is only digit in input
  Multiply elements together and reassign to array of digits
  Increment counter by 1
Return counter

Second pass:
Set int_arr to seperate input into array of digits ([9,9,9], [4])
Set counter to 0
Until int_arr size is 1
  Multiply all elements in int_arr together 9,9,9 == 729
  Reassign int_arr to array of digits from multiplication [7,2,9]
  Increment counter by 1 (1)
Return counter (output)

=end

def persistence(int)
  int_arr = int.digits
  counter = 0

  until int_arr.size == 1
    int_arr = int_arr.inject(:*).digits
    counter += 1
  end
  
  counter
end

p persistence(39) == 3
p persistence(4) == 0 # Already 1 digit
p persistence(25) == 2
p persistence(999) == 4
