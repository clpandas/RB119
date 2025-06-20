=begin
Given an array of strings made only from lowercase letters, return an array of all characters that show up in all strings within the given array (including duplicates).
For example, if a character occurs 3 times in all strings but not 4 times, you need to include that character three times in the final answer. 

problem: given an array of strings as input, return an array where the elements are all characters that appear in all elements of input string
- the character must appear in all elements of input string to be counted in output

type: frequency of characters, string comparisons

EX
["bella", "label", "roller"] ->b (no), e (yes- push to result arr), l (yes- push to result arr), l (yes- push to result arr) a (no) --> ["e", "l", "l"]
- we should be able to tell if a char should in output arr by comparing chars from only the first element

["cool", "lock", "cook"] -> 
c => 1
o => 2
l => 1
[c, o, l]

l => 1
o => 1
c => 1
k => 1
[l, o, c, k]

c => 1
o => 2
k => 1
[c, o, k]

b/c c appears in all three frequencies push the character of the count into result arr
b/c o appears in all 3 frq push the char of the smallest count into result arr
--> ["c", "o"]

DS
in: array of strings
out: array of single string characters
int: 
op1- iterate through character of first string element and compare against all other elemnts in input arr
op2- hash to track frequencies of characters for each element, find all common chars, use smallest value to push as count into result arr

algorithm
- define a result array to push characters into
- convert each word to a character frequency hash
- keep only characters that appear in all freqency hashes
  - for each character, keep the minimum count found in all hashes
- use final freq hash to push characters into result array using count as multiplier for each character
=end

def common_char(arr)
  result = []
  
  frequencies = arr.map { |word| word.chars.tally }
  common_chars = frequencies.first.select do |char, count|
      frequencies[1..-1].all? { |freq| freq.key?(char) }
  end

  common_chars.each do |char, count|
    min_count = frequencies.map { |freq| freq[char] || 0 }.min
    min_count.times do
      result << char
    end
  end

  result
end

# # video solution: more similar to my option 1
# def common_char(arr)
#   arr_dup = arr.map { |word| word.dup }

#   chars = arr_dup.shift.chars

#   chars.select do |char|
#     arr_dup.all? { |word| word.sub!(char, '') }
#   end
# end

p common_char(["bella", "label", "roller"]) == ["e", "l", "l"]
p common_char(["cool", "lock", "cook"]) == ["c", "o"]
p common_char(["hello", "goodbye", "booya", "random"]) == ["o"]
p common_char(["aabbaaaa", "ccdddddd", "eeffee", "ggrrrrr", "yyyzzz"]) == []