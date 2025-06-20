=begin
Find the length of the longest substring in the given string that is the same in reverse

As an example, if the input was "I like racecars that go fast", the substring (racecar) length would be 7

If the length of the input string is 0, return value must be 0

Example:
'a' -> 1
'aab' -> 2
'abcde' -> 3
'zzbaabcd' -> 4
'' -> 0

problem: given a string, return the size of the longest substring that is a palindrome within the string 
- substring of size 1 does not count
- palindrome is a string that is the same when in reverse

DS
in: string
out: integer representing size of longest palindrome substring of input string 
int: array of all substrings to 

HL: find all substrings, filter for palindromes, return max by size

algorithm
- define find substrings helper method
- define a palindrome checker helper method
- find substrings for input string
- select for only palindromes
- transform substrings to their size
- return the max size

helper method: find substrings
- define empty result arr to build into
- iterate through range from 0 to size of string (exclusive) to use as start_i
  - iterate through range from start_i to size of string (exclusive) to use as end_i
    - push a slice using a range from start_i to end_i of string into result arr
- return result arr

helper method: palindrome checker
- is the string input the same as the string input in reverse
=end

def find_substrings(str)
  result = []

  (0...str.size).each do |start_i|
    (start_i...str.size).each do |end_i|
      result << str[start_i..end_i]
    end
  end

  result
end

def is_palindrome?(str)
  str == str.reverse
end

def longest_palindrome(str)
  find_substrings(str).select { |substr| is_palindrome?(substr) }
                      .map(&:size)
                      .max
end


p longest_palindrome("a") == 1
p longest_palindrome("aa") == 2
p longest_palindrome("baa") == 2
p longest_palindrome("aab") == 2
p longest_palindrome("baabcd") == 4
p longest_palindrome("baablkj12345432133d") == 9
