=begin
PROBLEM: Count the lowercase letters in a string and return a hash with
the symbol letter as a key and the lowercase count as a string
-Input: String of letters
-Output: Hash with individual lowercase letters as symbols and their count
as a value
-Rules:
-Should I assume all inputs will be lowercase characters?(yes)
-How about all letters?(yes)

EXAMPLES:
letter_count('codewars') == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1}
letter_count('activity') == {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1}
letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}

THOUGHTS:
Need a hash with default 0 values
Need to count individual instances of characters (not their type)
Iterate over each character in string

DATA STRUCTURES:
Array (to contain individual characters in the string), Hash

ALGORITHM:
  - Set char_array to array of each string character
  - Iterate over each element in char_array with new hash w/ 0 defaults
    - If hash has the key represented as current element to symbol
      - Increment value by 1
    - Else
      - Set hash with current element symbol as key equal to 1
  - Return new hash

  EXTRA: DEAL WITH UPPERCASE AND NON ALPHABETICALS
    - Delete non-lowercase from string before converting to array
=end

def letter_count(string)
  string.delete('^a-z').chars.each_with_object({}) do |char, hash|
    key = char.to_sym
    if hash.key?(key)
      hash[key] += 1
    else
      hash[key] = 1
    end
  end
end

#Alternate solution 1
def letter_count(string)
  string.delete('^a-z').chars.uniq.each_with_object({}) do |char, hash|
    key = char.to_sym
    hash[key] = string.count(char)
  end
end

#Alternate solution 2
def letter_count(string)
  string.delete('^a-z').chars.map(&:to_sym).tally
end

p letter_count('codewars') == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1}
p letter_count('activity') == {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1}
p letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}
p letter_count(' Arith+metics') == {:c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}
