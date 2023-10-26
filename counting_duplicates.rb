=begin
PROBLEM: Take a string of characters and return an integer representing how many
alphanumeric characters occur more than once
-Input: String of alphanumeric characters
-Output: Integer representing how many characters repeat
-Rules:
-It doesn't matter how many times a character repeats - only that it does

EXAMPLES:
duplicate_count("") == 0
duplicate_count("abcde") == 0
duplicate_count("abcdeaa") == 1
duplicate_count("abcdeaB") == 2
duplicate_count("Indivisibilities") == 2

THOUGHTS:
-Want to iterate over each unique character in string
-Want to count the number of times a unique character appears in string
-ANY time would increment return count by 1

-Don't want to iterate over duplicates or they will be counted more than once

ALGORITHM:
-Set output to 0
-Iterate over every character in string
  -If the count of character in string is greater than 1
    -Increment output by 1
-Return output

=end

def duplicate_count(string)
  string_copy = string.downcase.chars.sort.uniq.join
  output = 0
  string_copy.each_char do |char| 
    output += 1 if string.downcase.count(char) > 1
  end
  output
end

#Alternate hash solution (I like first solution better unless we need exact amounts)
def duplicate_count(string)
  count_hash = string.downcase.chars.each_with_object({}) do |char, hash|
    if hash.key?(char)
      hash[char] += 1
    else
      hash[char] = 1
    end
  end

  count_hash.values.select { |val| val > 1 }.size
end


#Second attempt
def duplicate_count(string)
  uniq_chars = string.downcase.chars.uniq
  counter = 0
  uniq_chars.each { |char| counter += 1 if string.downcase.count(char) > 1 }

  counter
end

#Best solution
def duplicate_count(string)
  uniq_chars = string.downcase.chars.uniq
  uniq_chars.count { |char| string.downcase.count(char) > 1 }
end


p duplicate_count("") == 0
p duplicate_count("abcde") == 0
p duplicate_count("abcdeaa") == 1
p duplicate_count("abcdeaB") == 2
p duplicate_count("Indivisibilities") == 2
