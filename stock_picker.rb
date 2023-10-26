=begin
Implement a method #stock_picker that takes in an array of stock prices, 
one for each hypothetical day. It should return a pair of days representing 
the best day to buy and the best day to sell. Days start at 0.

PROBLEM:
Take an array of integers which correspond to a stock price on a unique day(input)
Return pair of days in array representing best day to buy/sell(output)
Days start at 0(Explicit Rule)
Goal is to maximize profit(Implicit Rule)
Have to buy before we can sell(Implicit Rule)
Can't retroactively buy/sell from past days. Only care about current and future(Implicit Rule)
  Means that max/min values will update

EXAMPLES:
[17,3,6,9,15,8,6,1,10]
17, 15 => loss of 2 (15 - 17)
3, 15 => Profit of 12 (15 - 3)
1, 10 => Profit of 9 (10 - 1) 

DATA STRUCTURES:
Array(to get possible sub arrays as a difference)

ALGORITHM:
Get all possible sub arrays (buy is outer index, sell is inner index)
Get max by sell value minus buy value

Set pairs_array to empty array
Iterate from 0 upto 1 minus the array size (outer_idx - as buy day) (0), (1), (2)
  Iterate from outer_idx plus 1 upto 1 minus array size (inner_idx - as sell day) (0..9), (1..9), (2..9)
    Push array at outer_idx and inner_idx onto pairs_array [17, 3], [17, 6], [17, 9]

Get max out of pairs array by element 1 - element 2 [3, 15]
Return index at element 0 from input, and index at element 1 from input [1,4]

=end

def stock_picker(array)
  pairs_array = []

  0.upto(array.size - 1) do |outer_idx|
    (outer_idx + 1).upto(array.size - 1) do |inner_idx|
      pairs_array << [array[outer_idx], array[inner_idx]]
    end
  end

  max_arr = pairs_array.max_by { |a,b| b - a }
  [array.index(max_arr[0]), array.index(max_arr[1])]
end

p stock_picker([17,3,6,9,15,8,6,1,10]) == [1,4]
