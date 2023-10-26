=begin
Some numbers have funny properties. For example:

89 --> 8¹ + 9² = 89 * 1
695 --> 6² + 9³ + 5⁴= 1390 = 695 * 2
46288 --> 4³ + 6⁴+ 2⁵ + 8⁶ + 8⁷ = 2360688 = 46288 * 51

Given a positive integer n written as abcd... (a, b, c, d... being digits) and a positive integer p
we want to find a positive integer k, if it exists, such as the sum of the digits of n 
taken to the successive powers of p is equal to k * n.

In other words:
Is there an integer k such as : (a ^ p + b ^ (p+1) + c ^(p+2) + d ^ (p+3) + ...) = n * k
If it is the case we will return k, if not return -1.

Note: n and p will always be given as strictly positive integers.

dig_pow(89, 1) should return 1 since 8¹ + 9² = 89 = 89 * 1
dig_pow(92, 1) should return -1 since there is no k such as 9¹ + 2² equals 92 * k
dig_pow(695, 2) should return 2 since 6² + 9³ + 5⁴= 1390 = 695 * 2
dig_pow(46288, 3) should return 51 since 4³ + 6⁴+ 2⁵ + 8⁶ + 8⁷ = 2360688 = 46288 * 51

PROBLEM:
Input:
Take a positive integer(n) written as (4, 6, 2, 8, 8)
Take a positive integer(p) successive powers (3..7)

Output:
Positive integer(k). (4³ + 6⁴+ 2⁵ + 8⁶ + 8⁷) = 2360688 
==  k * n (? * 46288) *k should be positive integer if it exists
Return -1 if k isn't a positive integer, else return k

Explicit Rule:
n and p will always be positive integers (inputs)

EXAMPLES:
89 --> 8¹ + 9² = 89 * 1
n = 89, p = 1, sum of digits raised to powers = 89
sum = k * n (89 = k * 89) sum / n = k => 89 / 89 = 1 (positive integer)

92 --> 9^1 + 2^2 = 13 * ~7.077 (k isn't an integer)
46288 --> 4³ + 6⁴+ 2⁵ + 8⁶ + 8⁷ = 2360688 = 46288 * 51
n = 46288, p = 3, sum = 2360688
k = sum / n (2360688 / 46288) = 51

695 --> 6² + 9³ + 5⁴= 1390 = 695 * 2
n = 695, p = 2, sum = 1390
1390 / 2.0 = 695.0
695.0 as integer equals self, so return self (not -1)

DATA STRUCTURES:
Input: Two positive integers
Intermediate: Array (store digits from n)
Output: A single positive integer or -1

THOUGHTS:

ALGORITHM:
Split n into an array of digits [4,6,2,8,8]
Raise each digit to a successive power of p (3..7) [64,...]
Set digits_sum to sum of array of digits (2360688)
Set k to division of digits_sum by n as a float (2360688/46288.0) == 51.0 
If k as integer equals self (51.0 == 51)
  Return k as integer (51)
Else
  Return -1



Raise each digit to a successive power of p (3..7) [64,...]
Iterate for array size times (5 times)
  Reassign digit to digit times p (64), (3), (4), (5), (6), (7)
  p += 1 (4), (5), (6), (7), (8)

=end


def dig_pow(n, pow)
  digits_sum = n.digits.reverse

  digits_sum.size.times.with_index do |_,idx|
    digits_sum[idx] = digits_sum[idx] ** pow
    pow += 1
  end

  digits_sum = digits_sum.sum

  k = digits_sum / n.to_f
  k.to_i == k ? k.to_i : -1
end

# Alternate answer
def dig_pow(n, pow)
  pow -= 1

  digits_sum = n.digits.reverse.map do |int|
    pow += 1
    int ** pow
  end.sum / n.to_f

  digits_sum.to_i == digits_sum ? digits_sum.to_i : -1
end

p dig_pow(89, 1) == 1
p dig_pow(92, 1) == -1
p dig_pow(46288, 3) == 51
p dig_pow(695, 2) == 2
