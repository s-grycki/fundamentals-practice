=begin
PROBLEM: (Start with inputs/outputs if confused. Read -> examples -> qs)
Take an array of consecutive letters and return the missing letter
Input: Array of letters
Output: Missing letter
Rules: (Also clarifies edge cases and questions)
  - Return empty array if input empty
  - Return opposite case of missing letter

EXAMPLES:


DATA STRUCTURES: (Update co-currently with algorithm, if needed)
  - Array

<====== THOUGHT PAD ======>
You got this one right in a fairly short amount of time. Good job. You did
run into some hiccups while implimenting the code from your algorithm, but you
quickly corrected them. One thing I will point out is how you almost returned
the next_char despite it being clearly stated to return the missing letter
not in the collection. This wasn't a big deal for you in this problem, since
you quickly thought of a fix, but this won't always be the case. Be sure to
always have the problem requirements in your head while doing the algorithm.
If ever in doubt, you won't be penalized for explicity addressing an edge case
<=========================>


Algorithm: (View as series of steps. Start high level on complex problems)
  - Iterate over each character in the array
    - Get ord value of current character
    - Get ord value of next character
    - Return next character if ord value isn't 1 more than current character
    - Be sure to swap case

  - Initialize LETTERS to every possible letter
  - Initialize letter_idx to matching index from first array element
  - Iterate over each letter in LETTERS with index
      - Return letter at letter idx when array at idx doesn't equal letter at letter_idx
      - Increment letter_idx by 1

=end

def determine_missing_letter(arr)
  arr.each_with_index do |letter, idx|
    current_char = letter.ord
    next_char = arr[idx + 1].ord
    missing_char = (current_char.ord + 1).chr
    return missing_char.swapcase if current_char + 1 != next_char
  end
end

LETTERS = ('a'..'z').to_a + ('A'..'Z').to_a

def determine_missing_letter(arr)
  return arr if arr.empty?
  letter_idx = LETTERS.index(arr.first)
  LETTERS.each_with_index do |_, idx|
    return LETTERS[letter_idx].swapcase if LETTERS[letter_idx] != arr[idx]
    letter_idx += 1
  end
end


p determine_missing_letter(%w(a b c d f))
p determine_missing_letter(%w(E G H I j))
p determine_missing_letter([])




#Second attempt
=begin
Take an array of consecutive letters and return the missing letter
determine_missing_letter(%w(a b c d f)) == 'E'
determine_missing_letter(%w(E G H I j)) == 'f'
determine_missing_letter([]) == []

PROBLEM: Take an array of consecutive letters and return missing letter
-Input: Array of letters
-Output: The missing letter with case swapped
-Rules:
-Return missing letter with case swapped
-Return empty array if input is empty

EXAMPLES:
determine_missing_letter(%w(a b c d f)) == 'E'
determine_missing_letter(%w(E G H I j)) == 'f'
determine_missing_letter([]) == []

THOUGHTS:
Checking to see if the letter that comes after the current is next in the array
Iterate over each character in array until the next letter after current
isn't next in the array

DATA STRUCTURE:
Array(to contain all valid letters)

ALGORITHM:
-Return self if input is empty
-Iterate over each character in string with index
  -Return next character swapcassed if next element in array doesn't equal next letter

=end

def determine_missing_letter(array)
  return array if array.empty?
  array.each_with_index do |letter, idx|
    return letter.succ.swapcase if array[idx + 1] != letter.succ
  end
end

#Alternate solution with difference method
def determine_missing_letter(array)
  return array if array.empty?
  Array(array.first..array.last).difference(array).first.swapcase
end


p determine_missing_letter(%w(a b c d f)) #== 'E'
p determine_missing_letter(%w(E G H I j)) #== 'f'
p determine_missing_letter([]) #== []
