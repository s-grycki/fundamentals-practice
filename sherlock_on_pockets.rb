=begin
Sherlock has to find suspects on his latest case. He will use your method, dear Watson. 
Suspect in this case is a person which has something not allowed in his/her pockets.

Allowed items are defined by array of numbers.

Pockets contents are defined by a hash where key is a person and value is one or few 
things represented by an array of numbers (can be nil or empty array if empty).

Write a method which helps Sherlock to find suspects. If no suspect is found or there 
are no pockets (`pockets == nil`), the method should return nil.

PROBLEM: Take a hash and check the hash values on each key(person). The values in 
input array represent the values that are allowed

-Input: Hash(pockets), and an array of allowed items(relative to values in the hash)
-Output: Suspect if they have a value that isn't allowed relative to input array (symbol in array)
-Rules:
-If all suspects have allowed iterms on them, return Nil
-Check if suspect has ANY item that isn't allowed in input Array

EXAMPLES:
# pockets = {}
# find_suspects(pockets, [1, 3]) == nil

# pockets = { tom: [2], bob: [2], julia: [3], meg: [3] }
# find_suspects(pockets, [2, 3]) == nil

# pockets = { julia: nil, meg: [] }
# find_suspects(pockets, [1, 6]) == nil

# pockets = { meg: [3], tom: [5] }
# find_suspects(pockets, []) == [:meg, :tom]

# pockets = { meg: [1, 3], tom: [5, 3] }
# find_suspects(pockets, [1, 3]) == [:tom]

THOUGHTS:
-Iterate over pockets hash. Check each value if they have a value that isn't in input Array

DATA STRUCUTRE:
Hash(Store values on each person), Array(store valid items)

ALGORITHM:
-Return nil if pockets hash is empty
-Set suspect_array to empty array
-Iterate over key/value pairs in hash
  -If any person has value that isn't included in Array
    -Push key onto suspect_array
-Return nil if suspect_array is empty. suspect_array otherwise


=end

def find_suspects(suspects, allowed_items)
  return nil if suspects.empty?
  suspect_array = []
  suspects.each do |person, items|
    next if items.nil? || items.empty?
    if items.any? { |item| !(allowed_items.include?(item)) }
      suspect_array << person
    end
  end
  suspect_array.empty? ? nil : suspect_array
end

pockets = {}
p find_suspects(pockets, [1, 3]) == nil

pockets = { tom: [2], bob: [2], julia: [3], meg: [3] }
p find_suspects(pockets, [2, 3]) == nil

pockets = { julia: nil, meg: [] }
p find_suspects(pockets, [1, 6]) == nil

pockets = { meg: [3], tom: [5] }
p find_suspects(pockets, []) == [:meg, :tom]

pockets = { meg: [1, 3], tom: [5, 3] }
p find_suspects(pockets, [1, 3]) == [:tom]





#Second attempt
=begin
Sherlock has to find suspects on his latest case. He will use your method, dear Watson. 
Suspect in this case is a person which has something not allowed in his/her pockets.

Allowed items are defined by array of numbers.

Pockets contents are defined by a hash where key is a person and value is one or few 
things represented by an array of numbers (can be nil or empty array if empty).

Write a method which helps Sherlock to find suspects. If no suspect is found or there 
are no pockets (`pockets == nil`), the method should return nil.

PROBLEM:
Suspect is person who has something not allowed in their pockets (input 1)
-key is person and value is items on them (in array)

Allowed items are an array of numbers (input 2)

Return nil if pockets == nil or no suspect is found

EXAMPLES:

THOUGHTS:
-Allowed items are defined by second input or nil/empty
-Return nil if pockets is empty
-Iterate over each key/value pair and check if person has item not
included in allowed items
  -If so, push person(key) onto new array

DATA STRUCUTRES:
Array(for output)

ALGORITHM:
-Return nil if pockets is empty
-Iterate over each key/value pair in pockets with new array (meg: [1, 3], tom: [5, 3])
  -If current value has any value not included in allowed items (and not empty/nil)
  [1, 3], [1, 3]. [1, 3], [5, 3] => 5 is not in allowed items
    -Push key(name) to new array (:tom)
-Return new array [:tom]

=end

def find_suspects(pockets, allowed_items)
  return nil if pockets.empty?

  suspect_arr = pockets.each_with_object([]) do |(name, items), suspects|
    if !items.nil? && items.any? { |item| !allowed_items.include?(item) } 
      suspects << name
    end
  end

  suspect_arr.empty? ? nil : suspect_arr 
end

pockets = {} 
p find_suspects(pockets, [1, 3]) == nil # pockets empty

pockets = { tom: [2], bob: [2], julia: [3], meg: [3] }
p find_suspects(pockets, [2, 3]) == nil # All suspects have allowed items

pockets = { julia: nil, meg: [] }
p find_suspects(pockets, [1, 6]) == nil # All suspects have allowed items (empty pockets)

pockets = { meg: [3], tom: [5] }
p find_suspects(pockets, []) == [:meg, :tom] # meg and tom have unallowed items

pockets = { meg: [1, 3], tom: [5, 3] }
p find_suspects(pockets, [1, 3]) == [:tom] # tom has unallowed item (5)
