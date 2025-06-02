=begin
Problem: Given a nonempty string as input, return the count of the longest vowel substring
Rules/req:
- the input string is all lowercase
- vowels are aeiou
- a string with no veowels returns 0
EX
l[au]nchschoolstudents --> 2
[eau] --> 3

DS
in: string
out: integer representing count of longest vowel substring
int:
- substrings

high level
- find all substrings
- filter for substrings with only vowels
- return max size substring

algorithm
- Define a variable to contain all substrings (use helper method)
- Select substrings that only contain vowels
- Return max size substring

Find all substrings helper method
- define an empty array to contain substrings
- iterate over a range representing indices to access substrings
- push substrings to result array
=end

# helper method
def find_all_substrings(str)
  result = []

  (0...str.size).each do |i|
    (i...str.size).each do |j|
      result << str[i..j]
    end
  end

  result
end

# main method
def longest_vowel_substring(str)
  return 0 unless str.chars.any? { |char| 'aeiou'.include?(char) }
  substrings = find_all_substrings(str)

  substrings.select do |substring|
    substring.chars.all? { |char| 'aeiou'.include?(char) }
  end.max_by(&:size).size
end

p longest_vowel_substring('cwm') == 0
p longest_vowel_substring('many') == 1
p longest_vowel_substring('launchschoolstudents') == 2
p longest_vowel_substring('eau') == 3
p longest_vowel_substring('beauteous') == 3
p longest_vowel_substring('sequoia') == 4
p longest_vowel_substring('miaoued') == 5