=begin
Given 2 strings, your job is to find out if there is a substring that appears in both strings.
You will return true if you find a substring that appears in both strings, or false if you do not.
We only care about substrings that are longer than one letter long.

problem: given two strings, return a boolean true or false if a substring appears in both strings
- substrings only count if they are at least two chars long
- return false if any string is empty
- case insensitive

EX
'Something', 'Home' -> 'om', 'ome', 'me' --> true
find all substrings in smaller string, check if any appear in other string?

'BANANA', 'banana' -> entire word is same --> true

'1234567', '541265' -> '12' --> true

'supercalifragilisticexpialidocious', 'SoundOfItIsAtrociou' -> 'iou' --> true

DS
in: two strings
out: boolean true or false
int: find substrings, compare substrings

HL: find all substrings of both inputs, reject substrings that are only 1 char long, compare substrings for smaller string size against other string, if any match other string substrings return true

algorithm
- define find substrings helper method
- normalize strings by downcasing inputs
- assign a local variable to reference substrings for both inputs
- reject substrings that are 1 char in size
- check if any of substrings from str1 substr appears in str2 substr list

helper method: find substrings
- define result arr to build into
- iterate through a range from 0 to the size of the str (exclusive) (start i)
  - iterate through a range from start_i to size of str (exclusive)
    - push a slice from string from start_i to end_i into result arr
- return result arr 
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

def substring_test(str1, str2)
  str1_substrings = find_substrings(str1.downcase).reject { |substr| substr.size == 1 }
  str2_substrings = find_substrings(str2.downcase).reject { |substr| substr.size == 1 }

  str1_substrings.any? { |substr| str2_substrings.include?(substr) }
end



p substring_test('Something', 'Fun') == false
p substring_test('Something', 'Home') == true
p substring_test('Something', 'Fun') == false
p substring_test('Something', '') == false
p substring_test('', 'Something') == false
p substring_test('BANANA', 'banana') == true
p substring_test('test', 'lllt') == false
p substring_test('', '') == false
p substring_test('1234567', '541265') == true
p substring_test('supercalifragilisticexpialidocious', 'SoundOfItIsAtrociou') == true
