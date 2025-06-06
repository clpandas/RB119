=begin
problem: given two strings as input, return a boolean true or false if any portion of the chars from the 1st string can be rearranged to match the chars in the second
rules/req:
- both string inputs will only contain lowercase alphabetic chars
- neither string input will be empty
- excess letter can occur in 1st input, but not 2nd

EX
 -> --> nothing remains at the end --> true
aa -> e --> letters remain in both --> false
bdfe ->  --> nothing remains in 2nd str --> true

DS
in: str1 and str2
out: boolean true or false
int: converting strings to an array of chars for easier comparison

high level
- check if all chars in str2 appear in str1
- remove letters from both strings if they appear in both string --> return true if 2nd string is empty by the end, false if not empty
- use an array to track if there is a char in 2nd input that is not in 1st input --> return false if array is not empty by the end
- track frequencies of chars in both strings, check that for each char in str2, str1 has at least that many

algorithm
- duplicate str1 so no mutation is happening when comparing
- for each char in str2
  - if char is not found in dup, return false
  - if found, remove one occurence from dup
- return true if all chars are iterated through 
=end

# high level v1
def unscramble(str1, str2)
  freq1 = str1.chars.tally
  freq2 = str2.chars.tally

  freq2.all? { |char, count| (freq1[char] || 0) >= count }
end

# # high level v2
# def unscramble(str1, str2)
#   str1_dup = str1.dup

#   str2.each_char do |char|
#     i = str1_dup.index(char)
#     return false unless i
#     str1_dup.slice!(i)
#   end

#   true
# end

# # high level v3
# def unscramble(str1, str2)
#   str1_dup = str1.chars
#   missing = []

#   str2.chars.each do |char|
#     if str1_dup.include?(char)
#       str1_dup.delete_at(str1_dup.index(char))
#     else
#       missing << char
#     end
#   end

#   missing.empty?
# end

# # high level v4
# def unscramble(str1, str2)
#   freq1 = Hash.new(0)
#   freq2 = Hash.new(0)

#   str1.chars.each { |char| freq1[char] += 1 }
#   str2.chars.each { |char| freq2[char] += 1 }

#   freq2.all? do |char, count|
#     freq1[char] >= count
#   end
# end

# # high level v4 alt
# def unscramble(str1, str2)
#   freq1 = str1.chars.tally
#   freq2 = str2.chars.tally

#   freq2.all? do |char, count|
#     return false if char == nil
#     freq1[char] || 0 >= count
#   end
# end


p unscramble('ansucchlohlo', 'launchschool') == true
p unscramble('phyarunstole', 'pythonrules') == true
p unscramble('phyarunstola', 'pythonrules') == false
p unscramble('boldface', 'coal') == true