=begin
Problem: Given a string, return a hash where the keys are the lowercase letters from the string and the values are the count of occurences
Rules/req:
- only consider lowercase letters
  - ignore uppercase/symbols/spaces
EX
'W. E. B. Du Bois' --> {u => 1, o => 1, i => 1, s => 1}
'' --> {}

DS
in: string
out: hash
int:
 - a range of lowercase alphabetical chaaracters ('a'..'z')
 - convert string to array of chars
 - a hash with default values to build into? (= Hash.new { |hash, key| hash[key] = 0 } )

high level
- iterate through chars of input string, increment count for lowercase chars in hash

algorithm
- Define an empty hash to build into
- Convert input string to an array of chars
- Iterate through array of chars
  - if char is lowercase, increment the value associated with that char in the hash
- Return hash
=end

def count_letters(str)
  result = Hash.new { |hash, key| hash[key] = 0 }

  str.each_char do |char|
    result[char] += 1 if ('a'..'z').include?(char)
  end
      
  result
end

expected = {'w' => 1, 'o' => 2, 'e' => 3, 'b' => 1, 'g' => 1, 'n' => 1}
p count_letters('woebegone') == expected

expected = {'l' => 1, 'o' => 1, 'w' => 1, 'e' => 4, 'r' => 2,
            'c' => 2, 'a' => 2, 's' => 2, 'u' => 1, 'p' => 2}
p count_letters('lowercase/uppercase') == expected

expected = {'u' => 1, 'o' => 1, 'i' => 1, 's' => 1}
p count_letters('W. E. B. Du Bois') == expected

p count_letters('x') == {'x' => 1}
p count_letters('') == {}
p count_letters('!!!') == {}