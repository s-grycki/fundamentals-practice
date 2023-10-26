=begin
# Write a method that takes an array of integers and returns the
# two numbers that are closest together in value.

# Examples:

p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 17]) == [12, 7]

# The tests above should print "true".

PROBLEM: Take an array of integers and return the two integers closest in value
-Input: Array of integers
-Output: Two values from array with lowest difference in array
-Rules:
-Do not overwrite previously checked pairs unless difference is smaller

EXAMPLES:
p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 17]) == [12, 7]

THOUGHTS:
-Iterate through each integer and store the value in a different array
-Check the difference between the current integer and all stored integers
on each iteration
-Need a variable to track current lowest difference
-Need array to store current lowest pairs

DATA STRUCUTRES:
Arrays(to hold current lowest difference pair, to append values on each iteration)

ALGORITHM:
-Set lowest_difference to sum of array values
-Set pairs_array to empty array
-Iterate over each integer in array with a new array
  -Check difference of current integer with every saved int in new array
  -If current difference is lower than lowest_difference
    -Reassign lowest_difference to current difference
    -Reassign pairs_array to pairs
-Return pairs_array


=end

def closest_numbers(array)
  pairs = []

  0.upto(array.size - 1) do |outer_idx|
    (outer_idx + 1).upto(array.size - 1) do |inner_idx|
      pairs << [array[outer_idx], array[inner_idx]]
    end
  end

  pairs.min_by { |a, b| (a - b).abs }
end



p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 17]) == [12, 7]
