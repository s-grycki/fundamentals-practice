=begin
In this kata, you've to count lowercase letters in a given string and return
the letter count in a hash with 'letter' as key and count as 'value'. 
The key must be 'symbol' instead of string in Ruby and 'char' 
instead of string in Crystal.

p letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}

PROBLEM: Take a string of lowercase letters and return a hash with letter as symbol and
the count of each as a value
-Input: A string of lowercase letters
-Output: A hash with counts as values and char symbols as keys
-Rules:
-Make character a symbol for hash

EXAMPLES:
p letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}

THOUGHTS:
-Iterate over each occurance of character in string and count relative to input

DATA STRUCTURE:
Hash, Array(for iteration)

ALGORITHM:
-Iterate over each unique character in string with hash
  -Set hash to char symbol with count of occurances in input as value
  -Return hash

=end

def letter_count(string)
  string.chars.uniq.each_with_object({}) do |char, hash|
    hash[char.to_sym] = string.count(char)
  end
end

p letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}
