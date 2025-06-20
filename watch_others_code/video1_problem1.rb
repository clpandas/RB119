=begin
Given a non-empty string check if it can be constructed by taking a substring of it and appending multiple copies of the substring together. 
You may assume the given string consists of lowercase English letters only.

Example 1:
Input: 'abab'
Output: True
Explanation: It's the substring 'ab' twice

Input: 'aba'
Output: False

problem: given a string, return a boolean true or false depending on if you can create the string by appending multiple copies of a substring from the string

EX
true:
abab (4 chars)
abaababaab (10 chars)
abcabcabcabc (12 chars)

DS
in: string
out: boolean true or false
int: 
- find substrings up to half the size of string
- compare multiples of substrings against input string for boolean output

HL: find substrings and multiply until the size of input string to compare against input string

algorithm
- define find substrings helper method
- find substrings up to half of the input string size
- select only the substrings divide evenly into input string size
- multipy substring until it matches input string size
- compare against input string
=end

def find_substrings(str)
  result = []
  (0...str.size).each do |start_idx|
    (start_idx...str.size).each do |end_idx|
      result << str[start_idx..end_idx]
    end
  end

  result
end

def repeated_substring_pattern(str)  
  str_half = str[0...str.size / 2]
  possible_substrings = find_substrings(str_half).select { |substring| str.size % substring.size == 0 }

  possible_substrings.each do |substring|
    multiplier = str.size / substring.size
    return true if substring * multiplier == str
  end

  false
end

p repeated_substring_pattern("abab") == true
p repeated_substring_pattern("aba") == false
p repeated_substring_pattern("aababa") == false
p repeated_substring_pattern("abaababaab") == true
p repeated_substring_pattern("abcabcabcabc") == true