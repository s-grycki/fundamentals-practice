=begin
Polycarpus works as a DJ in the best Berland nightclub, and he often uses dubstep
music in his performance. Recently, he has decided to take a couple of old songs 
and make dubstep remixes from them.

Let's assume that a song consists of some number of words (that don't contain WUB). 
To make the dubstep remix of this song, Polycarpus inserts a certain number of 
words "WUB" before the first word of the song (the number may be zero), after the 
last word (the number may be zero), and between words (at least one between any pair 
of neighbouring words), and then the boy glues together all the words, including 
"WUB", in one string and plays the song at the club.

For example, a song with words "I AM X" can transform into a dubstep remix as 
"WUBWUBIWUBAMWUBWUBX" and cannot transform into "WUBWUBIAMWUBX".

Recently, Jonny has heard Polycarpus's new dubstep track, but since he isn't into 
modern music, he decided to find out what was the initial song that Polycarpus remixed. 
Help Jonny restore the original song.

Input
The input consists of a single non-empty string, consisting only of uppercase English letters, 
the string's length doesn't exceed 200 characters

Output
Return the words of the initial song that Polycarpus used to make a dubsteb remix. 
Separate the words with a space.

Examples
song_decoder("WUBWEWUBAREWUBWUBTHEWUBCHAMPIONSWUBMYWUBFRIENDWUB") => WE ARE THE CHAMPIONS MY FRIEND

PROBLEM:
Song consists of some number of words (not containing WUB)
Insert "WUB" before first word of song
Insert "WUB" after last word
Insert "WUB" between words
Insert all the words back together into one string
Number of WUBS inserted may be zero for first/last(Explicit Rule)
Number of WUBS inserted between words must be at least one(Explicit Rule)

Take a string with "WUB"s inserted(input)
Return a new string with "WUB"s removed(output)

Explicit input rules:
Input will be a single, non-empty string
Will consist of uppercase letters only
Length will not exceed 200 characters

Explicit output rules:
Seperate original words with spaces

EXAMPLES:
"I AM X" => "WUBWUBIWUBAMWUBWUBX"
"I AM X" =/=> "WUBWUBIAMWUBX"
("WUBWEWUBAREWUBWUBTHEWUBCHAMPIONSWUBMYWUBFRIENDWUB") => 
("WUB, WE, WUB, ARE, WUBWUB, THE, WUB, CHAMPIONS, WUB, MY, WUB, FRIEND, WUB")

DATA STRUCTURES:
Input: String of uppercase words seperated by "WUB"s
Intermediate: Array(split string according to WUB pattern)
Output: String of uppercase words seperated by spaces

THOUGHTS:
Split according to pattern(regex)

ALGORITHM:
Split string according to /WUB/ pattern ["", "WE", "ARE", "", "THE", "CHAMPIONS", "MY", "FRIEND"]
Delete elements from array that are empty ["WE", "ARE", "THE", "CHAMPIONS", "MY", "FRIEND"]
Join back into string seperated by spaces (desired output)

=end

def song_decoder(string)
  string.split(/WUB/).reject(&:empty?).join(' ')
end

p song_decoder("AWUBBWUBC") == "A B C"
p song_decoder("AWUBWUBWUBBWUBWUBWUBC") == "A B C"
p song_decoder("WUBAWUBBWUBCWUB") == "A B C"
