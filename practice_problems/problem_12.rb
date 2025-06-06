=begin
problem: Given a string as input, return a boolean true or false depending on if the string is a pangram or not
rules/req:
- a pangram is a sentence with each letter of the alphabet occuring at least once
- case is irrelevant

EX
DS
in: string
out: boolean true or false
int: a range representing each letter of the alphabet

high level
- iterate through each letter of the alphabet and check if each letter is included in the input str

algorithm
- downcase input string for case insensitivity
- define a range from 'a'..'z' to represent the alphabet
- iterate through each letter of the alphabet and check if each letter is included in the input str (all? --> true or false)
=end

def is_pangram(str)
  normalized_str = str.downcase

  ('a'..'z').all? { |char| normalized_str.include?(char) }
end

p is_pangram('The quick, brown fox jumps over the lazy dog!') == true
p is_pangram('The slow, brown fox jumps over the lazy dog!') == false
p is_pangram("A wizard’s job is to vex chumps quickly in fog.") == true
p is_pangram("A wizard’s task is to vex chumps quickly in fog.") == false
p is_pangram("A wizard’s job is to vex chumps quickly in golf.") == true

my_str = 'Sixty zippers were quickly picked from the woven jute bag.'
p is_pangram(my_str) == true