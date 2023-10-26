=begin
Background
There is a message that is circulating via public media that claims a reader can
easily read a message where the inner letters of each words is scrambled, as long as 
the first and last letters remain the same and the word contains all the letters.

Another example shows that it is quite difficult to read the text where all the 
letters are reversed rather than scrambled.
In this kata we will make a generator that generates text in a similar pattern, 
but instead of scrambled or reversed, ours will be sorted alphabetically

Requirement
return a string where:
1) the first and last characters remain in original place for each word
2) characters between the first and last characters must be sorted alphabetically
3) punctuation should remain at the same place as it started, for example: shan't -> sahn't
Assumptions
1) words are seperated by single spaces
2) only spaces separate words, special characters do not, for example: tik-tak -> tai-ktk
3) special characters do not take the position of the non special characters, for example: -dcba -> -dbca
4) for this kata puctuation is limited to 4 characters: hyphen(-), apostrophe('), comma(,) and period(.)
5) ignore capitalisation
for reference: http://en.wikipedia.org/wiki/Typoglycemia


PROBLEM:
Take a string of characters(Input)
Return a string with second through second to last characters sorted(Output)

Explicit Requirements:
Maintain position of first and last character
Sort characters between first and last alphabetically
Punctuation should remain in same place (don't sort this)
Words are seperated by SINGLE spaces
Punctuation is limited to 4 characters => -, ', ,, .
Ignore case

Implicit Requirements:
Multiples of the same character will appear
Return self if input is empty or 3 characters or less
Maintain order of first LETTER and last LETTER. Sort everything in-between
Sort individual words if multiple words

Questions:
Can I just assume all characters will be lowercase?
Will numbers ever be included?

EXAMPLES:
('card-carrying') == 'caac-dinrrryg' => 'c' - sort 3 letters - keep dash in place - sort rest of string
until last character

DATA STRUCTURES:
Input: String of characters - assume only 4 valid punctuation
Intermediate: Array(to handle grouping behaviors)
Output: String of characters with everything between first and last LETTER sorted alphabetically - relative to indivudal words
Helper: Array(to define valid punctuation)

THOUGHTS:
Wanted to split words based on punctuation, but would need to handle sorting behavior across
multiple elements

Get first and last index of each word (still doesn't handle punctuations)

Possible approach (seems messy)
Get indexes where valid punctuation occurs in an array of characters for each words
  Delete at these indexes for each word (if saved value isn't nil)
    THEN sort alphabetically between first and last index
      THEN insert punctuation back in (if not nil)

WENT WITH THIS:
Easier version of the problem: Just sort everything except first and last characters in every word
Get the indexes of associated punctuation for each word and set as own subarray in array
Delete all punctuation in current word
Sort everything as is Between index 1 and -2 (would solve easier problem here)
Iterate back over each word and reinsert punctuation at correct index using corresponding word indexes
Return as string rejoined by spaces between words

ALGORITHM:
First pass:
Split into array of space seperated words (would only apply to last example)
Sort alphabetically between first and last instance of letter
  Maintain order if valid punctuation
Return as new string with words seperated by spaces

Second pass:
Set punc_arr to empty array
Split into array of space seperated words (['card-carrying', 'professionals'])

Iterate through each word with an index ('card-carrying', 0), ('professionals', 1)
  Iterate through each character in each word with an index (c,a,r,d,-,c,a,r,r,y,i,n,g), (p,r,o,f,e,s,s,i,o,n,a,l,s)
    Push word index, character index and character onto punc_arr if not a letter [0, 4, '-']

Set words_arr to Iteration through each word in input (['card-carrying', 'professionals'])
  Reassign word to deletion of all non-letters (cardcarrying)
  Reassign word to first character plus word[1..-2] sorted plus last character (caacdinrrryg)

Iterate through each word in words_arr with an index (caacdinrrryg', 0), (paefilnoorsss', 1)
  Iterate through each subarray in punc_arr [0, 4, -]
    if current index equals word index (0 == 0)
      Insert character at character index into current word ('caac-dinrrryg')

Join words_arr back into space seperated string of words ('caac-dinrrryg paefilnoorsss') *output

=end

def scramble_words(string)
  return string if string.size <= 3
  punc_arr = []

  #Get all punctuation indexes for each word
  string.split.each_with_index do |word, word_idx|
    word.chars.each_with_index do |char, char_idx|
      punc_arr << [word_idx, char_idx, char] if !('a'..'z').include?(char)
    end
  end

  #Sort all words according to constraints without punctuation
  words_arr = string.split.map do |word|
    word = word.delete('^a-z')
    word[0] + word[1..-2].chars.sort.join + word[-1] 
  end

  #Reinsert punctuation into associated words
  words_arr.each_with_index do |word, idx|
    punc_arr.each do |word_idx, char_idx, char|
      if idx == word_idx
        word.insert(char_idx, char)
      end
    end
  end

  words_arr.join(' ')
end

p scramble_words('professionals') == 'paefilnoorsss'
p scramble_words('i') == 'i'
p scramble_words('') == ''
p scramble_words('me') == 'me'
p scramble_words('you') == 'you'
p scramble_words('card-carrying') == 'caac-dinrrryg'
p scramble_words("shan't") == "sahn't"
p scramble_words('-dcba') == '-dbca'
p scramble_words('dcba.') == 'dbca.'
p scramble_words("you've gotta dance like there's nobody watching, love like you'll never be hurt, sing like there's
nobody listening, and live like it's heaven on earth.") == "you've gotta dacne like teehr's nbdooy wachintg, love like ylo'ul neevr be hrut, sing like teehr's nbdooy leiinnstg, and live like it's haeevn on earth."

#NOTE: ACTUAL programming behind the scenes isn't pretty. There should be a methodical problem solving
#process (which I intentionally kept in). Just posting solutions isn't good practice when a good
#majority of programming is showing the ability to problem solve and debug. In this case, I
#decided to start working with an easier version of the problem. From there, the answer flowed
#to me as a series of logical sub-steps. Did it take a while? Sure, but I wouldn't have solved
#this on my own otherwise
