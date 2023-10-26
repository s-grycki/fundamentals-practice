# A substring is a contiguous (non-empty) sequence of characters within a string.
  
# A vowel substring is a substring that only consists of vowels ('a', 'e', 'i', 'o', and 'u') and has all five vowels present in it.
  
# Given a string word, return the number of vowel substrings in word.

=begin
PROBLEM:
-Input: String word (as a single word)
-Output: Integer with the number of vowel substrings
-Rules:
  - A continous substring should have all 5 vowels in it

-DATA STRUCTURE

-THOUGHTS
  - Array?

-ALGORITHM
  GET ALL POSSIBLE SUBSTRING
    - Set substring_array to empty array
    - Set outer_idx to 0
    - Iterate over each character except the final one
      - Set inner_idx to 1 + outer_idx (so program keeps selecting 2 characters)
      - Iterate over all characters from outer_idx to inner_idx
        - Append current selected substring onto substring_array
        - Increment inner_idx by 1
      - End inner loop
      - Increment outer_idx by 1
    - End outer loop

  COUNT SUBSTRINGS THAT ONLY CONSIIST OF ALL 5 VOWELS
    - Iterate over each substring in substring_array
      - Delete any non-vowels
      - Sort character positions as an array to remove duplicates as string
      - Count all substrings with 5 vowel instances
    - Count how many elements meet these requirements
      
=end

def count_vowel_substrings(str)
  substring_array = all_substrings(str)
  only_all_vowels(substring_array)
end

def all_substrings(str)
  substring_array = []
  outer_idx = 0
  until outer_idx >= str.size - 1
    inner_idx = 1 + outer_idx
    until inner_idx >= str.size
      substring_array << str[outer_idx..inner_idx]
      inner_idx += 1
    end
    outer_idx += 1
  end
  substring_array#.select { |str| str.size >= 2 }
end

def only_all_vowels(substring_array)
  substring_array.select do |substring|
    substring = substring.chars.sort.join.squeeze # Only care about all vowels at least once
    substring =~ /aeiou/ # Will return 0 if truthy. Nil if falsy
  end.size
end



p count_vowel_substrings("abcde") == 0
p count_vowel_substrings("cuaieuouac") == 7 #(Returns 14)
p count_vowel_substrings("aeiouu") == 2
p count_vowel_substrings("unicornarihan") == 0








# Second attempt
=begin

# A substring is a contiguous (non-empty) sequence of characters within a string.
  
# A vowel substring is a substring that only consists of vowels ('a', 'e', 'i', 'o', and 'u') and has all five vowels present in it.
  
# Given a string word, return the number of vowel substrings in word.

p count_vowel_substrings("abcde") #== 0
p count_vowel_substrings("cuaieuouac") #== 7
p count_vowel_substrings("aeiouu") #== 2
p count_vowel_substrings("unicornarihan") #== 0

PROBLEM: Take a string of characters and return the number of substrings which consist
of only all 5 vowels
-Input: String of characters
-Output: Integer representing the number of strings which consist of only all 5
vowels in any amount
-Rules:
-Valid substring should be ONLY all 5 vowels at least once EACH in any amount

EXAMPLES:
p count_vowel_substrings("abcde") #== 0
p count_vowel_substrings("cuaieuouac") #== 7
p count_vowel_substrings("aeiouu") #== 2
p count_vowel_substrings("unicornarihan") #== 0

THOUGHTS:
-Check if every substring counts all vowels at least once
-Iterate over every vowel to confirm a count of at least one
-Need to check if string with only vowels still equals itself

DATA STRUCTURES:
Array(to hold substrings, and to hold vowels)

ALGORITHM:
-Set substring_array to empty array

-Iterate from 0 upto string size minus 1 with outer_idx
  -Iterate from outer_idx upto 1 minus string size again
    -If all 5 vowels are counted in current substring at least once AND
      -If substring with only vowels equals itself
        -Push this substring to substring_array

-Return number of elements in substring_array
=end

def count_vowel_substrings(string)
  substring_array = []
  0.upto(string.size - 1) do |outer_idx|
    outer_idx.upto(string.size - 1) do |inner_idx|

      if %w(a e i o u).all? { |vowel| string[outer_idx..inner_idx].count(vowel) >= 1 }
        if string[outer_idx..inner_idx].delete('^aeiou') == string[outer_idx..inner_idx]
          substring_array << string[outer_idx..inner_idx]
        end
      end

    end
  end
  
  substring_array.size
end


p count_vowel_substrings("abcde") == 0
p count_vowel_substrings("cuaieuouac") == 7
p count_vowel_substrings("aeiouu") == 2
p count_vowel_substrings("unicornarihan") == 0



#Alternate other student solution
def count_vowel_substrings(string)
  counter = 0

  5.upto(string.size) do |length|
    string.chars.each_cons(length) do |chars_arr|
      all_vowels = chars_arr.all? { |char| %w(a e i o u).include?(char) }
      counter += 1 if all_vowels && chars_arr.uniq.size == 5
    end
  end

  counter
end

p count_vowel_substrings("abcde") == 0
p count_vowel_substrings("cuaieuouac") == 7
p count_vowel_substrings("aeiouu") == 2
p count_vowel_substrings("unicornarihan") == 0
