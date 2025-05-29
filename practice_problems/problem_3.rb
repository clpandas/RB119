=begin
Problem: Given a string as input, return a copy of the string with every second character in every third word converted to uppercase
Rules/Req:
- Other chars remain the same
- If word has less than 2 chars, return word (unchanged)

Example
'Lorem Ipsum |is| simply dummy |text| of the |printing| world'
--> 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG world'

'It is |a| long established |fact| that a |reader| will be |distracted|'
--> 'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'

DS
in: string
out: copy of string modified so every 2nd char of every 3rd word is upcased
int:
  - split the string into an array of words
  - split words to an array of chars

High level
- Helper method: uppercase 2nd char of word
- Iterate through a string of words and transform every 3rd word with upcase 2nd char helper method
- Return the array of words back to a string

Algorithm
- Given a string of words
- Split string into an array of words with an index
- Iterate through array of words
  - If index + 1 is divisible by 3, use helper method 

upcase 2nd chars of word helper method
- Given a word as input 
- Convert to an array of chars
- Define an empty `result` array to build into
- Iterate through each char with an index
  - If char is at an odd index, append upcased char to result
  - Else, append char to result
- Return result
=end

# helper method
def upcase_2nd_chars(word)
  word.chars.map.with_index do |char, idx|
    idx.odd? ? char.upcase : char
  end.join
end

# main method
def to_weird_case(str)
  str.split.map.with_index do |word, idx|
    (idx + 1) % 3 == 0 ? upcase_2nd_chars(word) : word
  end.join(' ')
end


original = 'Lorem Ipsum is simply dummy text of the printing world'
expected = 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG world'
p to_weird_case(original) == expected

original = 'It is a long established fact that a reader will be distracted'
expected = 'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case(original) == expected

p to_weird_case('aaA bB c') == 'aaA bB c'

original = "Mary Poppins' favorite word is supercalifragilisticexpialidocious"
expected = "Mary Poppins' fAvOrItE word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS"
p to_weird_case(original) == expected