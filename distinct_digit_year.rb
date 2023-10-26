=begin
The year of 2013 is the first year after the old 1987 with only distinct digits.

Now your task is to solve the following problem: given a year number, 
find the minimum year number which is strictly larger than the given one 
and has only distinct digits.

next_unique_year(1987) == 2013

PROBLEM: Take a year represented by integer digits and return the next sequence
of all unique digits after the input

THOUGHTS:
-Need to check each digit to see if all are unique
  -Return integer if so (else increment by 1)

-Can check if all unique array of digits equals array of digits

DATA STRUCUTRES:
Array

ALGORITHM:
-Set digits_array to array of digits
-Until digits_array with all uniques equals digits array
  -Reassign digits_array to integer plus 1 and convert back to array
-Return digits_array
=end

def next_unique_year(year)
  digits_array = (year + 1).digits.reverse
  until digits_array.uniq == digits_array
    digits_array = (digits_array.join.to_i + 1).digits.reverse
  end
  digits_array.join.to_i
end

p next_unique_year(1987) == 2013
