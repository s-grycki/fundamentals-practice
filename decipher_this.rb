=begin
You are given a secret message you need to decipher. Here are the things you need 
to know to decipher it:

For each word:
the second and the last letter is switched (e.g. Hello becomes Holle)
the first letter is replaced by its character code (e.g. H becomes 72)
Note: there are no special characters used, only letters and spaces

Examples
decipherThis('72olle 103doo 100ya'); // 'Hello good day'
decipherThis('82yade 115te 103o'); // 'Ready set go'

PROBLEM:
Take a string of words(input)
Return a new string with words translated(output)
Switch the 2nd and last letter in each word
The first letter of each word is replaced by ordinance value
Only letters and spaces will be used(Explicit Rule)

EXAMPLES:
A.ord = 65, (w),(i)s(e)

DATA STRUCTURE:
Array(swapping behavior)

THOUGHTS:
Preserve integers when spliting

ALGORITHM:
Translate each number in each word into a letter
Swap the 2nd and last letter in each word
Return as new translated string

Split input into array of elements [65, 119esi, 111dl]
Iterate over each word in array 119esi
  Count elements that are string integers (3)
  Split subarr from 0 to 1 less than count (0..2)
  Concat onto string from count to end
  Substitute first element for ordinance value of letter

Parallel assign first and last index of each word 'esi' => 'ise'

Join back from nested array into a string [['A'], ['w'], ['ise']]


=end

def decipher_this(string)
  string.split.map do |word|
    ints = word.count('0-9')
    arr = [word[0...ints].to_i.chr] + [word[ints..-1]]
    arr[1][0], arr[1][-1] = arr[1][-1], arr[1][0] if !arr[1].empty?
    arr.join
  end.join(' ')
end

p decipher_this("65 119esi 111dl 111lw 108dvei 105n 97n 111ka") == "A wise old owl lived in an oak"
p decipher_this("84eh 109ero 104e 115wa 116eh 108sse 104e 115eokp") == "The more he saw the less he spoke"
p decipher_this("84eh 108sse 104e 115eokp 116eh 109ero 104e 104dare") == "The less he spoke the more he heard"
p decipher_this("87yh 99na 119e 110to 97ll 98e 108eki 116tah 119esi 111dl 98dri") == "Why can we not all be like that wise old bird"
p decipher_this("84kanh 121uo 80roti 102ro 97ll 121ruo 104ple") == "Thank you Piotr for all your help"
