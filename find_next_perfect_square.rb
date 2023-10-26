=begin
You might know some pretty large perfect squares. But what about the NEXT one?

Complete the findNextSquare method that finds the next integral perfect square
after the one passed as a parameter. Recall that an integral perfect square is 
an integer n such that sqrt(n) is also an integer.

If the parameter is itself not a perfect square then -1 should be returned. 
You may assume the parameter is non-negative.

findNextSquare(121) == 144
findNextSquare(625) == 676
findNextSquare(114) == -1

PROBLEM: 
Take an integer and return the next perfect square if input is a perfect
square. Else, return negative 1

EXAMPLES:
findNextSquare(121) == 144
findNextSquare(625) == 676
findNextSquare(114) == -1


THOUGHTS:
-Iterate from 1 upto input (1..input)
  -Break (integer + 1) ** 2 if (integer ** 2) == input
  -Break -1 if integer ** 2 > input  

DATA STRUCTURES:


ALGORITHM:
-Iterate from 1 upto input (1..input)
  -Break (integer + 1) ** 2 if (integer ** 2) == input
  -Break -1 if integer ** 2 > input

=end

def findNextSquare(integer)
  1.upto(integer) do |int|
    break (int + 1) ** 2 if int ** 2 == integer
    break -1 if int ** 2 > integer
  end
end

p findNextSquare(121) == 144
p findNextSquare(625) == 676
p findNextSquare(114) == -1
