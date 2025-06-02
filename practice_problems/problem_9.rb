=begin
Problem: Given 2 string inputs, return the number of times the second input occurs in the first input
Rules/req:
- overlapping strings do not count
  - e.g. 'babab' has 1 occurence of 'bab', not 2
- the second input is not going to be an empty string

EX
'', 'x' --> 0
'babab', 'x' --> 0
'babab', 'b' --> 3

DS
in: str1, str2
out: integer representing the count of times 2nd input appears in the 1st
int:
- array containing substrings the length of the 2nd input

high level
- start at beginning of 1st input and check if a substring starting from there matches the 2nd input
- if a match is found, count it and skip ahead by the length of the 2nd string to avoid overlapping
- if no match is found, move ahead by one char
- repeat until there isn't enough chars of the 1st input left to match the size of the 2nd input

algorithm
- Define a counter set to 0 to track matches
- Define an index i set to 0 to access substrings from the 1st input (slice)
- Loop while i <= str1.length - str2.length
  - slice into 1st input from position i with length equal to the 2nd input
  - if that slice == 2nd input
    - increment counter
    - move i forward by length of 2nd input (this prevents overlapping)
  - else
    - move i forward by a single char (b/c no match found)
- Return counter
=end

def count_substrings(str1, str2)
  count = 0
  i = 0
  target_size = str2.size

  while i <= str1.size - target_size
    if str1[i, target_size] == str2
      count += 1
      i += target_size
    else
      i += 1
    end
  end

  count
end

p count_substrings('babab', 'bab') == 1
p count_substrings('babab', 'ba') == 2
p count_substrings('babab', 'b') == 3
p count_substrings('babab', 'x') == 0
p count_substrings('babab', 'x') == 0
p count_substrings('', 'x') == 0
p count_substrings('bbbaabbbbaab', 'baab') == 2
p count_substrings('bbbaabbbbaab', 'bbaab') == 2
p count_substrings('bbbaabbbbaabb', 'bbbaabb') == 1