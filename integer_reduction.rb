=begin
In this Kata, you will be given two integers n and k and your task is to 
remove k-digits from n and return the lowest number possible, 
without changing the order of the digits in n. Return the result as a string.

Let's take an example of solve(123056,4). We need to remove 4 digits from 
123056 and return the lowest possible number. The best digits to remove 
are (1,2,3,6) so that the remaining digits are '05'. Therefore, solve(123056,4) = '05'.

Note also that the order of the numbers in n does not change: solve(1284569,2) = '12456', 
because we have removed 8 and 9.

PROBLEM:
Take two integers - integer 1 and 2(Input)
Remove integer 2 number digits from integer 1 and return lowest possible number.
Do not change digit order. Return as string(Output)

EXAMPLES:
(123056,4) => (12), (13), (10), (15), (16), | (23), (20), (25), (26) | (30), (35), (36) |
(05), (06) | (56) *Need groups of 2 - which is integer size minus integer 2
=> 05 => '05'

(1284569,2) => (14569), (18569), (18459), (18446) ... => 12456 => '12456' 
# Get every possibility where only 2 digits are deleted from the integer in place (not sorted)

START AT FIRST ELEMENT AND REMOVE INTEGER 2 ELEMENTS FOR ALL POSSIBLE
(123056,4) => 12, 13, 10, 15, 16 | 23, 20, 25, 26 | 30, 35, 36 | 05, 06 | 56 => 05
(1284569,2) => Remove 2 each time starting at first integer. Once you have all possible
using this integer, continue. Wouldn't want to include previous numbers due to order
requirement

DATA STRUCTURES:
Input: 2 Integers (initial integer, number of digits to delete)
Intermediate: Array containing all possibilites with k digits deleted
Output: Smallest integer possible with k number digits deleted
Helper: Array of possibilites

THOUGHTS:
All digits need to be in correct order relative to input
Remove exactly integer2 number digits and get all possibilities
Need to remove in non-consecutive manner
Array size minus int2 is how many digits elements we want pushed 

In the first example, we are working with nested iteration logic. We only
want current digit in outer iterator, plus a current current index in an
inner iterator starting at 1 after outer iteration. This process continues
so that the current outer element increments by 1 until there is only one
element returned in the inner iteration

It's best to think about this in terms of array size minus k. That's how many
digit elements we want grouped together on the inner iteration. As the outer
iterator progresses, some digits will naturally be excluded and count towards k

Work with a simpler problem: What if we only wanted to delete one digit each time?
Iterate over each digit with an index
  Return integers with digit at the current index deleted
  This will be all possibilities

What about 2?
  Same logic as above, except we're slicing 2 elements from array starting at index
  Need to filter out elements that aren't digits size minus k in size (sometimes slice at end of array)

What's making this problem difficult is the requirement to maintain order. If this requirement
were removed, then we could just delete the highest digit from n k times and sort the remaining
digits. Since we want to preserve order, we should compare previous digits with next digits, since
the largest values in an integer will be found on the left. If elements to left of a current digit
are higher, then delete them. Then, we can safely delete max digits without worrying about order

ALGORITHM:
First Pass:
Compare last digit to current digit
  Until last digit is greater than current digit
    Delete digits

Delete max digits from integer k remaining times

Return as string

Second Pass:
Set arr to empty array
Iterate over each character in input as a string
  While k is greater than 0 AND arr isn't empty AND last element in array is greater than current
    Delete last element from array
    Decrement k by 1
  
  Push digit onto arr

Iterate k times
  Set max_val to maximum value from arr
  Delete max_val from arr

Join arr into string

=end

def solve(n, k)

  #Delete highest possible digits in order
  arr = n.to_s.chars.each_with_object([]) do |digit, arr|

    while k > 0 && !arr.empty? && arr.last > digit
      arr.pop
      k -= 1
    end

    arr << digit
  end

  #Delete highest digit from array k remaining times
  k.times do
    max_val = arr.max
    arr.delete(max_val)
  end

  #Return as string of elements
  arr.join
end

    

p solve(123056,4) == '05'
p solve(1284569,2) == '12456'
