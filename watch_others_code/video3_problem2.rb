=begin
Write a method to find the longest common prefix string amongst an array of strings
If there is no common prefix, retun an empty string

Example 1
Input: ["flower", "flow", "flight"]
Output: "fl"

Input: ["dog", "racecar", "car"]
Output: ""
Explanation: There is no common prefix among the input strings

Note:
All given inputs are in lowercase letters a-z

problem: given an array of words, return the longest common prefix
- if no common prefix, return ""

EX
["flower", "flow", "flight"] -> '', 'f', 'fl' -->"fl"

DS
in: array of strings
out: string that represents longest common prefix
int: build longest common prefix by iterating and comparing characters of words in arr

algorithm
- define an empty str to represent the longest common prefix
- iterate through first word in array
  - for each character of that word, iterate with an index
   - compare first character(index) to first character(index) of all other words in array
    - if all words in array start with that character, push character to prefix string
- return prefix string
=end

def common_prefix(arr)
  longest_common_prefix = ''

  arr[0].chars.each_with_index do |char, idx|
    longest_common_prefix << char if arr.all? { |word| word[idx] == char }
  end

  longest_common_prefix
end

p common_prefix(["flower", "flow", "flight"]) == "fl"
p common_prefix(["dog", "racecar", "car"]) == ""
p common_prefix(["interspecies", "interstellar", "interstate"]) == "inters"
p common_prefix(["throne", "dungeon"]) == ""
p common_prefix(["throne", "throne"]) == "throne"