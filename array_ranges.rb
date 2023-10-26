=begin
A format for expressing an ordered list of integers is to use a comma separated 
list of either individual integers or a range of integers denoted by the starting 
integer separated from the end integer in the range by a dash, '-'. 
The range includes all integers in the interval including both endpoints. 
It is not considered a range unless it spans at least 3 numbers. 
For example "12,13,15-17"

Complete the solution so that it takes a list of integers in increasing order and 
returns a correctly formatted string in the range format.

PROBLEM:
Take a list of integers in increasing order(input)
Return a string with valid ranges formated to dash format. Otherwise, preserve commas (output)
Ranges span at least 3 consecutive numbers in order(Explicit Rule)
Ranges span from begining to endpoint and include numbers in between(Explicit Rule)
Integers in increasing order(Explicit Rule)

EXAMPLES:
"-10--8,-6,-3-1,3-5,7-11,14,15,17-20"
(-10, -9, -8), -6, (-3, -2, -1, 0, 1), (3, 4, 5), (7, 8, 9, 10, 11), 14, 15, (17, 18, 19, 20)

"-6,-3-1,3-5,7-11,14,15,17-20"
'-3--1,2,10,15,16,18-20'

DATA STRUCTURES:
Array(input)
Sub arrays(intermediate - array elements based on increasing consecutive order)
String(output)

THOUGHTS:
Checking if next integer is one more than last integer
Need previous integer when on current integer
Create dynamic prev_int variable
If were on the first iteration then automatically push current value onto
accumulating sub array and reassign prev_int to current element
Check if current equals one more than prev_int on each iteration
  If it does, then push onto subarray
  If it doesn't, then push subarray onto sub_arrs and reassign to empty array

ALGORITHM:
Get subarrays in a new array based on increasing consecutive order
Transform each subarray with size 3 or greater to a range
Join back into string with elements seperated by commas

Set sub_arrs to empty array
Set subarray to empty array

Iterate over each integer in array with an index [-3, -2, -1, 2, 10, 15, 16, 18, 19, 20] (0)
  If index is  0
    Push current integer onto subarray [-3]
    
  Else
    If current integer == prev_int plus 1 (-2 == -2), (-1 == -1)
      Push current integer onto subarray [-3, -2, -1]
    Else
      Push subarray onto sub_arrs [[-3,-2,-1], [2]]
      Reassign subarray to array with current integer in it [2], [10]
    End
    Reassign prev_int to current integer 
  End

  Set prev_int to current integer (-3), (-2), (-1), (2), (10)
  Push subarray onto sub_arrs if index == array size minus 1 [18, 19, 20]


Iterate over each subarray in sub_arrs [[-3,-2,-1], [2]]
  If subarray length is at least 3
    Transform to range from first value to last value as string '-3--1'
  Else
    Transform each element into a string ['2']
  End

Return sub_arrs as properly formated string seperated by commas [['-3--1'], ['2']]
  *Join inner elements by comma

  subarrays based on next interger being 1 more than last
  Push sub arrays onto sub_arr

=end

def solution(array)
  sub_arrs = []
  subarray = []
  prev_int = 0

  array.each_with_index do |integer, idx|
    if idx == 0
      subarray << integer
    else

      if integer == prev_int + 1
        subarray << integer
      else
        sub_arrs << subarray
        subarray = [integer]
      end

    end

    prev_int = integer
    sub_arrs << subarray if idx == array.size - 1
  end
  
  sub_arrs.map do |subarr| 
    subarr.size >= 3 ? "#{subarr[0]}-#{subarr[-1]}" : subarr.map(&:to_s).join(',')
  end.join(',')

end

#p solution([-10, -9, -8, -6, -3, -2, -1, 0, 1, 3, 4, 5, 7, 8, 9, 10, 11, 14, 15, 17, 18, 19, 20]) =="-10--8,-6,-3-1,3-5,7-11,14,15,17-20"
#p solution([-6, -3, -2, -1, 0, 1, 3, 4, 5, 7, 8, 9, 10, 11, 14, 15, 17, 18, 19, 20]) == "-6,-3-1,3-5,7-11,14,15,17-20"

#p solution([-3, -2, -1, 2, 10, 15, 16, 18, 19, 20]) == '-3--1,2,10,15,16,18-20'









# Refactored solution using slice_when (MUCH EASIER!!!)
# Slice_when takes two block values from a collection: The current element and the next,
# and slices the elements into sub-elements based on the truthiness of the block. The split
# occurs between current and next on truthy evaluations. This method is called for 1 minus the
# size of the calling collection, hence why it doesn't throw an error on the final evaluation.
# This method returns an enumerator by default (which is why it's converted to an array)
def solution(array)
  sub_arrs = array.slice_when { |cur,nex| cur + 1 != nex }.to_a

  sub_arrs.map do |subarr| 
    subarr.size >= 3 ? "#{subarr[0]}-#{subarr[-1]}" : subarr.map(&:to_s).join(',')
  end.join(',')

end


p solution([-10, -9, -8, -6, -3, -2, -1, 0, 1, 3, 4, 5, 7, 8, 9, 10, 11, 14, 15, 17, 18, 19, 20]) == "-10--8,-6,-3-1,3-5,7-11,14,15,17-20"
p solution([-6, -3, -2, -1, 0, 1, 3, 4, 5, 7, 8, 9, 10, 11, 14, 15, 17, 18, 19, 20]) == "-6,-3-1,3-5,7-11,14,15,17-20"

p solution([-3, -2, -1, 2, 10, 15, 16, 18, 19, 20]) == '-3--1,2,10,15,16,18-20'
