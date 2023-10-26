=begin
PROBLEM: Take a number and return all multiples of 3 and 5 BELOW the number
passed in. Sum the returned values
-Input: Integer
-Output: Integer as sum of 3 and 5 multiples from input
-Rules:
-Return 0 for negative inputs
-If it's divisble by 3 AND 5, then count it only once
-Integers less than 3 would have no multiples

EXAMPLES:
  test(10) == 23
  test(20) == 78
  test(200) == 9168

THOUGHTS:
  -Could use an array to capture different multiples
  -Want to write a conditional block so that only once case will evaluate (ternary?)

DATA STRUCTURES:
  -Array (to capture multiples)

ALGORITHM:
  -Return 0 if input is less than 4 (1 less than 3 is 2)
  -Set multiples to empty array
  -(Input - 1) downto 3 with number
    -If number divides evenly by 3 OR 5
      -Push number onto multiples
  -Return multiples summed as integer

=end

def test(input)
  return 0 if input < 4
  multiples = []
  (input - 1).downto(3) do |number|
    multiples << number if (number % 3 == 0) || (number % 5 == 0)
  end

  multiples.sum
end
      

p test(3) == 0
p test(4) == 3
p test(10) == 23
p test(20) == 78
p test(200) == 9168
