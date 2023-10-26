# Write a method named to_weird_case that accepts a string, and
# returns the same sequence of characters with every 2nd character
# in every third word converted to uppercase. Other characters
# should remain the same.

# Examples:

# p to_weird_case('Lorem Ipsum is simply dummy text of the printing') ==
#                 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
# p to_weird_case(
#   'It is a long established fact that a reader will be distracted') ==
#   'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
# p to_weird_case('aaA bB c') == 'aaA bB c'
# p to_weird_case(
#   'Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
#   'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'

# The tests above should print "true".

=begin
PROBLEM: Take a string and return the same sequence, but every other character in the third word
converted to uppercase. Other characters should remain the same
-Input: String of words
-Output: A string of the same words, but woth every third word swapped case
-Rules:
-We want to convert odd indexes to uppercase every third word
-We want to preserve case on even indexes

EXAMPLES:
p to_weird_case('Lorem Ipsum is simply dummy text of the printing') ==
                'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
p to_weird_case(
  'It is a long established fact that a reader will be distracted') ==
  'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case(
  'Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
  'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'

THOUGHTS:
-We want to ignore all but every third word
-We want to iterate over every word so that we can select every third word
  -We want to iterate over character in the third word and convert odd indexes to uppercase
-We want to return same elements, just with every third word trnasformed

-Convert string elements to array elements. Then convert every third element to an array of characters
-Need some kind of counter to know every third word

DATA STRUCTURES:
-Array(to hold word elements, and to hold characters of word in every third element)

ALGORITHM:
-Set counter to 0
-Iterate over every word in array and convert to array elements
-Iterate over every element in this array (preserving n number of elements)
  -Increment counter by 1
  -If counter divides evenly by 3 then convert current element to array of characters
-End

-Iterate over every element in words_array
  -Iterate over every element in array/word
  -If current element is an array
    -Iterate over each element with index and transform odd indexes to uppercase

=end

def to_weird_case(string)
  counter = 0
  string.split.map do |str|
    counter += 1
    if counter % 3 == 0
      str.chars.map.with_index do |char, idx|
        idx.odd? ? char.upcase : char
      end.join
    else
      str
    end
  end.join(' ')
end 



p to_weird_case('Lorem Ipsum is simply dummy text of the printing') == 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
p to_weird_case('It is a long established fact that a reader will be distracted') == 'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case('Miss Mary Poppins word is supercalifragilisticexpialidocious') == 'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'




#Second attempt
=begin
# Write a method named to_weird_case that accepts a string, and
# returns the same sequence of characters with every 2nd character
# in every third word converted to uppercase. Other characters
# should remain the same.

# Examples:

# p to_weird_case('Lorem Ipsum is simply dummy text of the printing') ==
#                 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
# p to_weird_case(
#   'It is a long established fact that a reader will be distracted') ==
#   'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
# p to_weird_case('aaA bB c') == 'aaA bB c'
# p to_weird_case(
#   'Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
#   'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'

# The tests above should print "true".

PROBLEM: Take a string and return the same characters with the odd indexes
of every third word upcased. The other elements should remain as is
-Input: A string of space seperate words
-Output: A string with the same characters, but odd indexes in 3rd words upcased
-Rules:
-Only want to change odd indexes in every 3rd word

EXAMPLES:
# p to_weird_case('Lorem Ipsum is simply dummy text of the printing') ==
#                 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
# p to_weird_case(
#   'It is a long established fact that a reader will be distracted') ==
#   'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
# p to_weird_case('aaA bB c') == 'aaA bB c'
# p to_weird_case(
#   'Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
#   'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'

THOUGHTS:
-Split elements into an array
-Iterate with a counter starting at 1 to transform all 3rd elements
  -Iterate over every index in the 3rd word to transform odds - evens remain same

DATA STRUCTURES:
Array(to contain word elements)

ALGORITHM:
-Set words_array to split of each word into an array element
-Iterate from 1 upto the size of words_array with counter
  -If counter is divisble by 3
    -Iterate over every element in word in an array with an index
      -If index is odd, transform letter to uppercase
      -Return letter otherwise
  -Join nested array back to string of space seperated words

=end



def to_weird_case(string)
  words_array = string.split
  1.upto(words_array.size) do |counter|

    if counter % 3 == 0
      word = words_array[counter - 1]
      words_array[counter - 1] = word.chars.map.with_index do |char, idx|
        idx.odd? ? char.upcase : char
      end.join
    end

  end
  words_array.join(' ')
end


def to_weird_case(string)
  string.split.map.with_index(1) do |word, word_idx|

    if word_idx % 3 == 0
      word.chars.map.with_index { |char, idx| idx.odd? ? char.upcase : char }.join
    else
      word
    end

  end.join(' ')
end

p to_weird_case('Lorem Ipsum is simply dummy text of the printing') #== 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
p to_weird_case('It is a long established fact that a reader will be distracted') #== 'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') #== 'aaA bB c'
p to_weird_case('Miss Mary Poppins word is supercalifragilisticexpialidocious') #== 'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'

