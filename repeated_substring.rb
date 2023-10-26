=begin
PROBLEM: Take astring and find the minimum repeating substring with the
size of the string divided by the size of the substring
-Input: String of characters
-Output: Minimum repeating substring with times repeating in an array [str, int]
-Rules:
-Minimum substring is the minimum that repeats itself across the entire string
-Floating point number wouldn't match integer requirement

EXAMPLES:
f("ababab") == ["ab", 3]
f("abcde") == ["abcde", 1]

THOUGHTS:
-I need the string size divided by the substring size
-If this number multiplied by the substring equals original string then it's
what we want
-Only need possible substrings from index 0
-Want to iterate through each character in string

DATA STRUCUTRES:
Array (to hold substrings from index 0)

ALGORITHM:
  -Set substring_array to empty array
  -Iterate 1 upto string size over string with index
    -Push string from index 0 to current index onto substring_array
  -Return substring_array

  -Set divider to string size
  -Iterate over each substring in substring_array
    -Set multiplier to divider / substring size
    -If substring times multiplier == string
      -Return [substring, multiplier]
    -Else
      -Return string

=end

def f(string)
  substring_array = []
  1.upto(string.size) do |idx|
    substring_array << string[0..idx]
  end

  divider = string.size
  substring_array.each do |substring|
    multiplier = divider / substring.size
    return [substring, multiplier] if substring * multiplier == string
  end
  
  string
end
      
#Alternate solution 1
def f(string)
  current_substring = ''

  string.each_char do |char|
    current_substring += char
    multiplier = string.size / current_substring.size
    return [current_substring, multiplier] if current_substring * multiplier == string
    return [string, 1] if multiplier == 1
  end

end

# Alternate solution 2
def f(string)
  string.size.times do |idx|
    sub_arrs = string.scan(string[0..idx])
    return [sub_arrs.first, sub_arrs.size] if sub_arrs.join == string
  end
end

p f("ababab") == ["ab", 3]
p f("abcde") == ["abcde", 1]
p f("a") == ["a", 1]
