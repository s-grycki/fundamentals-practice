=begin
Given: an array containing hashes of names
Return: a string formatted as a list of names separated by commas except 
for the last two names, which should be separated by an ampersand.

Example:


Note: all the hashes are pre-validated and will only contain A-Z, a-z, '-' and '.'.

PROBLEM:
Take an array containing hash key/value pairs(Input)
-Key is name and value is name as string
Return a string formated as a list of names seperated by commas and an & sign(Output)

All hashes contain only A-Z, a-z, -, and .(Explicit Rule)
Just return name if only one element(Implicit Rule)
Return empty string if list is empty(Implicit Rule)

EXAMPLES:
{name: 'Bart'}, {name: 'Lisa'}, {name: 'Maggie'} => (Bart), (Lisa), (Maggie) => 'Bart, Lisa & Maggie'
*Sperated by commas unless between last two elements
{name: 'Bart'}, {name: 'Lisa'} => (Bart), (Lisa) => 'Bart & Lisa'
*& between last 2 elements
{name: 'Bart'} => 'Bart'

DATA STRUCTURES:
Input: Array of hash elements - where values are the names we want to get
Intermediate: Array(to handle insertion behavior between elements)
Output: String of names seperated by appropriate characters (, ), ( & )
Helper: -

THOUGHTS:
Take care of no/single inputs first (logical seperation)
Insert commas between elements, then delete comma between last 2 before inserting &

ALGORITHM:
First pass:
Get all name values out of input
Insert commas with spaces between all elements
Insert ' & ' between last 2 elements 

Second pass:
If input is empty then return empty string [] => ''
Set names_arr to values in hashes of input array ['Bart', 'Lisa', 'Maggie']
If names_arr size is 1 return element as string ['Bart'] => 'Bart'

Join array into string seperated by commas 'Bart, Lisa, Maggie'
Split back into array by ', ' while preserving all elements ["Bart", ", ", "Lisa", ", ", "Maggie"]
Delete second to last element in names_arr ["Bart", ", ", "Lisa", "Maggie"]
Insert ' & ' at second to last names_arr element ["Bart", ", ", "Lisa", " & ", "Maggie"]
Join names_arr into a string and return 'Bart, Lisa & Maggie'

=end

def list(names)
  return '' if names.empty?
  names_arr = names.map { |hash| hash[:name] }
  return names_arr.first if names_arr.size == 1

  names_arr = names_arr.join(', ').split(/(, )/)
  names_arr.delete_at(-2)
  names_arr.insert(-2, ' & ').join
end

# Alternate solution with string interpolation
def list(names)
  names_arr = names.map(&:values).flatten
  final_name = names_arr.pop

  return '' if final_name.nil?
  return final_name if names.size == 1

  "#{names_arr.join(', ')} & #{final_name}"
end

p list([ {name: 'Bart'}, {name: 'Lisa'}, {name: 'Maggie'} ]) == 'Bart, Lisa & Maggie'
p list([ {name: 'Bart'}, {name: 'Lisa'} ]) == 'Bart & Lisa'
p list([ {name: 'Bart'} ]) == 'Bart'
p list([]) == ''
