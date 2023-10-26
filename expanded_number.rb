=begin

# You will be given a number and you will need to return it as a string in expanded form. For example:
#
# expanded_form(12); # Should return '10 + 2'
# expanded_form(42); # Should return '40 + 2'
# expanded_form(70304); # Should return '70000 + 300 + 4'
#
# Note: All numbers will be whole numbers greater than 0.

PROBLEM:
Take an integer and return a string of rounded numbers added together
-Input: Integer of various length
-Output: A string of rounded numbers from input
-Rules
  - Entire return should be a string

EXAMPLES:
753 == '700' + '50' + '3'

DATA STRUCTURE:
  - Arrays

THOUGHTS:
  - The input is rounded to nearest 0 ending integer
  - The remainder is rounded the same way until it doesn't end in 0
  - Divmod method?
  - Edge case where I want to push remainder onto array at final iteration

ALGORITHM:
  GET INTEGERS TO BE USED IN STRING
    - Set arr_nums to empty array
    - Loop
      - Set multiplier equal to 10 rasied to size of int / 10
      - Set int, remainder equal to divsion/modulus of multiplier
      - Multiply int by multiplier
      - Push int onto array unless int is equal to 0
      - Push remainder onto array if only one digit
      - Break if remainder is only one digit
      - Set int = remainder
    - Return arr_nums

  FORMAT ARRAY OF NUMBERS TO BE USED WITH A STRING
    - Push ' + ' onto every other array index (starting at 1)
    - Delete final unwanted array value
    - Convert each integer element to a string
    - Return array as a string

=end

def expanded_form(int)
  arr_nums = get_integers(int)
  format_array(arr_nums)
end

def get_integers(int)
  arr_nums = []
  loop do
    multiplier = 10 ** ((int / 10).to_s.size)
    int, remainder = int.divmod(multiplier)
    arr_nums << (int *= multiplier) unless int == 0
    arr_nums << remainder if remainder.to_s.size == 1
    break if remainder.to_s.size == 1 
    int = remainder
  end
  arr_nums
end

def format_array(arr_nums)
  signs = [' + '] * arr_nums.size
  arr = arr_nums.zip(signs).flatten
  arr.pop
  arr.join
end

def expanded_form(int)
  int.digits.filter_map.with_index do |num, idx|
    num * (10 ** idx) if num > 0
  end.reverse.join(' + ')
end

p expanded_form(12) == '10 + 2'
p expanded_form(42) == '40 + 2'
p expanded_form(70304) == '70000 + 300 + 4'
