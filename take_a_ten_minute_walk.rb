=begin
You live in the city of Cartesia where all roads are laid out in a perfect grid. 
You arrived ten minutes too early to an appointment, so you decided to take the 
opportunity to go for a short walk. The city provides its citizens with a Walk
Generating App on their phones -- everytime you press the button it sends you 
an array of one-letter strings representing directions to walk (eg. ['n', 's', 'w', 'e']). 
You always walk only a single block in a direction and you know it takes you one minute 
to traverse one city block, so create a function that will return true if the walk 
the app gives you will take you exactly ten minutes (you don't want to be early or late!) 
and will, of course, return you to your starting point. Return false otherwise.

Note: you will always receive a valid array containing a random assortment of direction letters 
('n', 's', 'e', or 'w' only). It will never give you an empty array 
(that's not a walk, that's standing still!).

PROBLEM:
Take an array of single character letters(input)
Return true if walk will take exactly 10 minutes. False otherwise(output)

Explicit Rules:
Phone sends array of one letter strings representing directions to walk when pressing button
One letter is one block which takes exactly one minute to walk (need 10 elements)
Need to return to starting point (need to come back to middle starting point at end)
Input will never be empty and will always be direction letters (n s w e)

      N  
     |
W -- x -- E
    |
    S

EXAMPLES:
n (up 1) => s (start) * 5 (end up back at start and 10 elements)
More than 10 elements (false)
Less than 10 elements and not at starting point (false)
n (up 3) => s (up 2) => End up 2 blocks north of start (false) (4-6).abs == 2

DATA STRUCTURES:
Input: Array of letter elements
Intermediate: Hash (if all elements have equal count and sum to 10 then true)
Output: Boolean (back at start and 10 elements)

THOUGHTS:
What if we went north 5 times and then east 5 times?
  Wouldn't be back at center
Group north/south and west/east

What if we went west 10 times and never east?
  Wouldn't want to substract nil (and logic instead)
  Also, wouldn't want this to return true (if they're all one letter return false)

ALGORITHM:
Return false unless array size is 10 (test case 2+3)
Get a tally of all letters in array {'n' => 5, 's' => 5}, {'n' => 6, 's' => 4}
If tally has a key of north OR south
  Perform absolute difference of 2 values (5 - 5).abs == 0, (6 - 4).abs == 2
  Return false unless difference is 0 x, false
If tally has a key of east OR west
  Perform absolute difference of 2 values
  Return false unless difference is 0

Return true

=end

def is_valid_walk(array)
  return false unless array.size == 10
  counts = array.tally

  if counts.key?('n') && counts.key?('s')
    return false unless (counts['n'] - counts['s']).abs == 0
  elsif counts.key?('e') && counts.key?('w')
    return false unless (counts['e'] - counts['w']).abs == 0
  elsif counts.keys.all? { |let| let == counts.keys.first }
    return false
  end

  true # has to be seperate because if/elsif block is testing for false evaluations
end

# true needed to be on it's own line. In the case of the first test case, it would
# match with the first test case. Since if/elsif is a single expression, it would
# return a value based on the first if check (nil since it's not returning false).
# Shows the need to be careful when determining the order of conditionals

# Explicitly returned booleans otherwise the conditionals would continue executing and
# only the final true return would be reflected. Unless filtered out by the guard clause,
# any 10 character array would just return true

p is_valid_walk(['n','s','n','s','n','s','n','s','n','s']) == true
p is_valid_walk(['w','e','w','e','w','e','w','e','w','e','w','e']) == false
p is_valid_walk(['w']) == false
p is_valid_walk(['n','n','n','s','n','s','n','s','n','s']) == false
#Added test cases when noticing implicit rules
p is_valid_walk(['w','w','w','w','w','w','w','w','w','w']) == false
p is_valid_walk(['w','w','e','e','n','n','s','s','n','s']) == true
p is_valid_walk(['w','w','n','n','s','s','e','e','e','w']) == true
