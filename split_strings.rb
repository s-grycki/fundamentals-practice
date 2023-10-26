=begin
Complete the solution so that it splits the string into pairs of two characters. 
If the string contains an odd number of characters then it should replace the 
missing second character of the final pair with an underscore ('_').

PROBLEM:
Take a string and split it into pairs of 2. Add underscore to final pair if
string size is odd

EXAMPLES:
'abc' => ['ab', 'c'] => ['ab', 'c_'] (last element has size of 1)

THOUGHTS:
-each_slice(2) method
  -Add underscore to end of final element if it has a size of 1

DATA STRUCTURES:
Array(use with each_slice)

ALGORITHM:
-Split string into array characters and slice by 2s ['a', 'b'], ['c']
  -If size of 2s is 1, push '_' ['a, b'], ['c_']
  -Push 2s onto new array with elements joined 'ab','c_'
  
-Return new array ['ab','c_']

=end

def solution(string)
  string.chars.each_slice(2).with_object([]) do |pairs, arr|
    pairs << '_' if pairs.size == 1
    arr << pairs.join
  end
end

p solution('abc') == ['ab', 'c_']
p solution('abcdef') == ['ab', 'cd', 'ef']
p solution("abcdefg") == ["ab", "cd", "ef", "g_"]
p solution("") == []
