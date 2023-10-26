=begin
Your task is to Reverse and Combine Words.
Input: String containing different "words" separated by spaces
1. More than one word? Reverse each word and combine first with second, third with fourth and so on...
(odd number of words => last one stays alone, but has to be reversed too)
2. Start it again until there's only one word without spaces
3. Return your result…

PROBLEM: Take a string of space seperated words and reverse the order of paired words and combine into single string
If more than one word, reverse each word and combine with pairs
If odd number of words last stays alone
Continue until single string without spaces

EXAMPLES:
("abc def ghi jkl") == "defabcjklghi"
fed cba  lkj ihg => fedcba lkjihg => abcdefghijkl

abc def ghi jkl
(cbafed) ihg lkj
cbafed (ihglkj)
cbafed ihglkj
(defabc) (jklghi)
defabcjklghi



def abc jkl ghi => defabcjklghi

("abc def") == "cbafed"
cba fed => cbafed

("234hh54 53455 sdfqwzrt rtteetrt hjhjh lllll12 44") == "trzwqfdstrteettr45hh4325543544hjhjh21lllll"

=end



=begin
Your task is to Reverse and Combine Words.
Input: String containing different "words" separated by spaces
1. More than one word? Reverse each word and combine first with second, third with fourth and so on...
(odd number of words => last one stays alone, but has to be reversed too)
2. Start it again until there's only one word without spaces
3. Return your result…

PROBLEM:
Reverse words and then combine them
Words are seperated by spaces
Combine pairs (1st/2nd, 3rd/4th) on each iteration
Leave final word alone but reverse if odd number of elements
Do this untul there's only one non-space word (Return self if single string)

EXAMPLES:
"abc def" => cba fed => cbafed
"sdfsdf wee sdffg 342234 ftt" => fdsfds eew, gffds 432243, ttf =>
fdsfdseew gffds432243 ttf => weesdfsdf 342234sdffg, ftt =>
weesdfsdf342234sdffg ftt => "gffds432243fdsfdseew", ttf =>
gffds432243fdsfdseewttf

THOUGHTS:
-Split into array of elements
-Iterate half array length plus 1 times if odd
-Iterate half array length if even
*Ternary logic

-each_slice(2) inside iterator to join after reversing elements

DATA STRUCUTRES:
Array

ALGORITHM:
-Set arr to array of elements ["abc", "def"]
-Set iterator to arr.size + 1 if odd, else arr.size

-Iterate iterator times (1)
  -Reverse each element in arr cba fed
  -Slice each element by 2 and reassign arr to join of each element cbafed
-Return arr.join "cbafed"

# Involved working through flawed logic at the code level and troubleshooting
# under time pressure

=end

def reverse_and_combine_text(string)
  arr = string.split
  output_arr = []
  return string if arr.join == string
  iterator = arr.size.odd? ? (arr.size / 2) + 1 : arr.size / 2

  until arr.size == 1 do
    arr = arr.map(&:reverse)
    output_arr = []
    arr.each_slice(2) { |arr| output_arr << arr.join }
    arr = output_arr
  end
  output_arr.join
end

#p reverse_and_combine_text("abc def") == "cbafed"
#p reverse_and_combine_text("abc def ghi jkl") == "defabcjklghi"
#p reverse_and_combine_text("dfghrtcbafed") == "dfghrtcbafed"
#p reverse_and_combine_text("234hh54 53455 sdfqwzrt rtteetrt hjhjh lllll12 44") == "trzwqfdstrteettr45hh4325543544hjhjh21lllll"
#p reverse_and_combine_text("sdfsdf wee sdffg 342234 ftt") == "gffds432243fdsfdseewttf"




=begin
Your task is to Reverse and Combine Words.
Input: String containing different "words" separated by spaces
1. More than one word? Reverse each word and combine first with second, third with fourth and so on...
(odd number of words => last one stays alone, but has to be reversed too)
2. Start it again until there's only one word without spaces
3. Return your result…

PROBLEM: Take a string of words and reverse the order of each word if more than one.
Group together by pairs. Repeat this process until there's only one string without
spaces

EXAMPLES:
("abc def") => cba fed => cbafed
("abc def ghi jkl") => cba fed ihg lkj => cbafed ihglkj =>
defabc jklghi => defabcjklghi
("sdfsdf wee sdffg 342234 ftt") => fdsfdseew gffds432243 ttf =>
weesdfsdf342234sdffg ftt => gffds432243fdsfdseewttf

THOUGHTS:
-Guard clause for single word strings
-Inside an iteration
  -Reverse each word element in string
    -Then join paired array elements into single word
  -Break iteration if string is single word

DATA STRUCTURES:
Array(to contain words as elements)

ALGORITHM:
-Set words to split each word input into array of elements
-Until size of words is 1
  -Reverse each word [cba, fed, ihg, lkj]
  -Take slices of array elements by 2 and join them [cbafed, ihglkj] (reassign to words)
-Return words as string

=end

def reverse_and_combine_text(string)
  words = string.split
  #return string if words.size == 1

  until words.size == 1
    words = words.map(&:reverse).each_slice(2).map(&:join)
  end
  words.join

end


p reverse_and_combine_text("abc def") == "cbafed"
p reverse_and_combine_text("abc def ghi jkl") == "defabcjklghi"
p reverse_and_combine_text("dfghrtcbafed") == "dfghrtcbafed"
p reverse_and_combine_text("234hh54 53455 sdfqwzrt rtteetrt hjhjh lllll12 44") == "trzwqfdstrteettr45hh4325543544hjhjh21lllll"
p reverse_and_combine_text("sdfsdf wee sdffg 342234 ftt") == "gffds432243fdsfdseewttf"
