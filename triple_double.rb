=begin

Write a function
triple_double(num1, num2)
which takes numbers num1 and num2 and returns 1 if there is a straight triple
of a number at any place in num1 and also a straight double of the same number in num2.
If this isn't the case, return 0
Examples
triple_double(451999277, 41177722899) == 1
# num1 has straight triple 999s and num2 has straight double 99s
triple_double(1222345, 12345) == 0
# num1 has straight triple 2s but num2 has only a single 2

p triple_double(12345, 12345) == 0
p triple_double(1222345, 12345) == 0
p triple_double(666789, 12345667) == 1
p triple_double(451999277, 41177722899) == 1

PROBLEM: Take two integers of digits and return 1 if there are 3 consecutive
digits in integer 1 and 2 consecutive digits in integer 2. 0 Otherwise

EXAMPLES:
p triple_double(12345, 12345) == 0
p triple_double(1222345, 12345) == 0
p triple_double(666789, 12345667) == 1
p triple_double(451999277, 41177722899) == 1

THOUGHTS:
-Split first integer into consecutives of 3, second into consecutives of 2
-Check if any consecutives have all same elements in both arrays

DATA STRUCUTRE:
Arrays(to contain digit consecutives)

ALGORITHM:
GET ALL VALID SLICES
-Set arr_doubles to empty array
-Set arr_triples to empty array

-Iterate over each digit in integer1
  -Push arrays onto arr_triples in groups of 3

-Iterate over each digit in integer2
  -Push arrays onto arr_doubles in groups of 2

CHECK IF ALL SAME ELEMENTS IN ANY SUBARRAY IN BOTH ARRAYS
-If any sub arrays in arr_triples AND any sub arrays in arr_doubles are all the same
  -Return 1
-Return 0 otherwise

=end

def triple_double(int1, int2)
  arr_doubles, arr_triples = get_groups(int1, int2)
  
  if arr_triples.any? { |arr| arr.sum == arr.first * 3 }
    if arr_doubles.any? { |arr| arr.sum == arr.first * 2 }
      return 1
    end
  end

  0
end

def get_groups(int1, int2)
  arr_triples = int1.digits.reverse.each_cons(3).with_object([]) { |arr, trips| trips << arr }
  arr_doubles = int2.digits.reverse.each_cons(2).with_object([]) { |arr, dubs| dubs << arr }
  [arr_doubles, arr_triples]
end

p triple_double(12345, 12345) == 0
p triple_double(1222345, 12345) == 0
p triple_double(666789, 12345667) == 1
p triple_double(451999277, 41177722899) == 1
