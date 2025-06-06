=begin
problem: Given a string as input, return the count of distinct case-insensitive alphabetic chars and numeric digits that occur more than once in input str
rules/req:
- input str contains only alphanumeric chars

EX
'xyz' --> 0 b/c no chars appear more than once
'xxyypzzr' -> xx, yy, zz --> 3
'3141592653589793' -> 3:1, 1:2, 4:1, 5:1...  --> 4

DS
in: string of alphanumeric chars
out: integer representing distinct case insensitive alphanumeric chars that appear more than once
int: hash to track frequency of char count, convert str to array of chars

high level/alg
- downcase input string for case insensitivity
- get frequency of character count
- return count of chars whose values are > 1

=end

def distinct_multiples(str)
  char_count = str.downcase.chars.tally
  char_count.count { |k, v| v > 1 }
end

p distinct_multiples('xyz') == 0               # (none
p distinct_multiples('xxyypzzr') == 3          # x, y, z
p distinct_multiples('xXyYpzZr') == 3          # x, y, z
p distinct_multiples('unununium') == 2         # u, n
p distinct_multiples('multiplicity') == 3      # l, t, i
p distinct_multiples('7657') == 1              # 7
p distinct_multiples('3141592653589793') == 4  # 3, 1, 5, 9
p distinct_multiples('2718281828459045') == 5  # 2, 1, 8, 4, 5