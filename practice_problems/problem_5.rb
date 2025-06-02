=begin
problem: Given a string as input, return the character that occurs most often in the string
rules/req:
- if there are multiple chars with the same greatest occurence, return the one that appears first in the string 
- when counting chars, consider upper and lowercase versions to be the same (case-insensitive)

EX
'aaaaaAAAA' --> 'a'
'Mississippi' --> m:1, i: 4, s:4, p:2 --> 'i'

DS
in: string
out: string (single char)
int:
- keep track of chars count with a hash

high level
- track character count with a hash
- return the char with the highest count

algorithm
- downcase string for case insensitivity
- convert downcased string into an array of chars
- create a hash of character counts from array of chars
- return key from kv pair with highest value 
=end

def most_common_char(str)
  normalized_str = str.downcase
  normalized_str.chars.tally.max_by { |k, v| v }.first
end

p most_common_char('Hello World') == 'l'
p most_common_char('Mississippi') == 'i'
p most_common_char('Happy birthday!') == 'h'
p most_common_char('aaaaaAAAA') == 'a'

my_str = 'Peter Piper picked a peck of pickled peppers.'
p most_common_char(my_str) == 'p'

my_str = 'Peter Piper repicked a peck of repickled peppers. He did!'
p most_common_char(my_str) == 'e'