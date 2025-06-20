=begin
Write function scramble(str1, str2) that returns true if a portion of str1 characters can be rearranged to match str2, otherwise return false

For example:
str1 is `rkqodlw` and str2 is 'world' the output should return true.
str1 is 'cedewaraaossqqyt' and str2 is 'codewars' should return true.
str1 is `katas` and str2 is `steak` should return false.

Only lowercase letters will be used (a-z).
No punctuation or digits will be included.

problem: given two strings, return a boolean true or false all characters in str2 can be used in str1

'javaass', 'jjss' -> 
str1 j:1, a:3, v:1, s:2
str2 j:2, s:2 (missing 1 j)
--> false

'rkqodlw', 'world'->
str1 r:1, k: 1, q:1, o:1, d:1, l:1, w:1
str2 w:1, o:1, r:1, l:1, d:1
--> true

DS
in: 2 strings
out: boolean true or false
int: a hash to track character frquency for each string

algorithm
- define a variable to track char freqency for each string
- do all chars in str2 appear in str1 && is the count of character occurence for all of str2 at least equal to or greater than the occurence in str1
=end

def scramble(str1, str2)
  str1_freq = str1.chars.tally
  str2_freq = str2.chars.tally

  str2_freq.all? { |char, count| str1_freq.key?(char) && str1_freq[char] >= count }
  # str2_freq.all? { |char, count| str1_freq[char].to_i >= count }
end

# def scramble(str1, str2)
#   str2.each_char do |char|
#     return false if str2.count(char) > str1.count(char)
#   end

#   true
# end

# def scramble(str1, str2)
#   str2.chars.uniq.all? do |char|
#     str1.count(char) >= str2.count(char)
#   end
# end


p scramble('javaass', 'jjss') == false
p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak') == false
p scramble('scriptjava', 'javascript') == true
p scramble('scriptingjava', 'javascript') == true