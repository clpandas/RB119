=begin
problem: Given a string as input, return an array where the first element is a string and the second element is an integer
rules/req:
- string input: s --> output: [t, k] => s == t * k
- the values of t and k should be the shortest possible substring, and the largest possible repeat count that satisfies the equation
- the string input consists of only lowercase alphabetic chars

EX
'xyzxyzxyz' -> 'xyz|xyz|xyz' count: 3 --> ['xyz', 3]
'aaaaaaaa' -> 'a|a|a|a|a|a|a|a' count: 8 --> ['a', 8]

DS
in: string
out: two element array where the first el is the shortest possible substring, and the second el is the largest repeat count where the substring fits into the original string
int:
- integer to track repeat count of substring

HL
find the smallest repeating substring that can be multiplied to be the same as the original string

algorithm
- loop through substring lengths starting at index 0
  - for each substring assign to t
    - check if t can be divided evenly by the length of the input string, skip if it can't
    - get count k by dividing the size of input string to the size of the substring
  - check if t * k matches (==) input str, return [t, k] if it does 
- if no repeat pattern is found, return [str, 1]
=end

def repeated_substring(str)
  (1..str.size).each do |length|
    t = str[0, length]
    next if str.size % t.size != 0
    k = str.size / t.size
    return [t, k] if t * k == str
  end
end

p repeated_substring('xyzxyzxyz') == ['xyz', 3]
p repeated_substring('xyxy') == ['xy', 2]
p repeated_substring('xyz') == ['xyz', 1]
p repeated_substring('aaaaaaaa') == ['a', 8]
p repeated_substring('superduper') == ['superduper', 1]