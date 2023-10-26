=begin
Pete likes to bake some cakes. He has some recipes and ingredients. 
Unfortunately he is not good in maths. Can you help him to find out, 
how many cakes he could  bake considering his recipes?
Write a function cakes(), which takes the recipe (object) 
and the available ingredients (also an object) and returns the
maximum number of cakes Pete can bake (integer). 
For simplicity there are no units for the amounts (e.g. 1 lb of flour or
200 g of sugar are simply 1 or 200). 
Ingredients that are not present in the objects, can be considered as 0.

Examples:
// must return 2
cakes({flour: 500, sugar: 200, eggs: 1}, {flour: 1200, sugar: 1200, eggs: 5, milk: 200});
// must return 0
cakes({apples: 3, flour: 300, sugar: 150, milk: 100, oil: 100}, {sugar: 500, flour: 2000, milk: 2000});

PROBLEM: 
Take a recipe and available ingredients (as hashes)
Return maximum number of cakes Pete can bake based on this (integer)
Assume no units
Ingredients not present in required amounts should be considered 0

EXAMPLES:
({"flour"=>500, "sugar"=>200, "eggs"=>1},{"flour"=>1200, "sugar"=>1200, "eggs"=>5, "milk"=>200}) == 2
=> 1200/500, 1200/200, 5/1, 200(skip since not in recipe)
=> Get min from these divisions [2, 6, 5] => 2

({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>500, "flour"=>2000,
"milk"=>2000}) == 0
=> 0/3 (apples are not in available ingredients return 0) => 0

({"eggs"=>4, "flour"=>400},{}) == 0
=> 0/4 (eggs are not in available ingredients return 0) => 0

({"cream"=>1, "flour"=>3, "sugar"=>1, "milk"=>1, "oil"=>1, "eggs"=>1},{"sugar"=>1, "eggs"=>1, "flour"=>3,
"cream"=>1, "oil"=>1, "milk"=>1}) == 1
=> 1/1 (can only bake one cake for sure if any divisions evaluate to 1) => 1

THOUGHTS:
-If any keys are in hash 1 but not hash 2, return 0
-If any values evaluate to 0 return 0
-If any values evaluate to 1 return 1
-Otherwise, get min from array of divided values

DATA STRUCTURES:
Arrays(to get values from hashes and store divisions)

ALGORITHM:
-hash1_keys = hash1 keys
-hash2_keys = hash2 keys

-If any value in hash1_keys isn't in hash2_keys return 0

-Iterate through each value in hash1_keys with a new array
  -Push hash2[key] / hash1[key] onto new array
-Return min from new array

=end

def cakes(hash1, hash2)
  hash1_keys = hash1.keys
  hash2_keys = hash2.keys

  return 0 unless hash1_keys.all? { |ing| hash2_keys.include?(ing) }

  hash1_keys.each_with_object([]) do |key, arr|
    arr << hash2[key] / hash1[key]
  end.min
end

p cakes({"flour"=>500, "sugar"=>200, "eggs"=>1},{"flour"=>1200, "sugar"=>1200, "eggs"=>5, "milk"=>200}) == 2
p cakes({"cream"=>200, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>1700, "flour"=>20000, "milk"=>20000, "oil"=>30000, "cream"=>5000}) == 11
p cakes({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>500, "flour"=>2000, "milk"=>2000}) == 0
p cakes({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>500, "flour"=>2000, "milk"=>2000, "apples"=>15, "oil"=>20}) == 0
p cakes({"eggs"=>4, "flour"=>400},{}) == 0
p cakes({"cream"=>1, "flour"=>3, "sugar"=>1, "milk"=>1, "oil"=>1, "eggs"=>1},{"sugar"=>1, "eggs"=>1, "flour"=>3, "cream"=>1, "oil"=>1, "milk"=>1}) == 1
