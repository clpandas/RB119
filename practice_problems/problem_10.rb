=begin
problem: Given a string of digits, return the count of even numbered substrings that can be formed
rules/req:
- substrings are sequential (42 --> 4, 42, 2 -- 24 is not valid)
- if a substring occurs more than once, count it as a separate substring

EX
'1432' --> '14', '1432', '4', '432', '32', '2' --> 6 total

DS
in: string of digits
out: integer representing count of even numbered substrings
int: an array to contain all possible substrings

high level
- find all substrings
- select for even num substrings
- return count

algorithm
- Define find all substrings helper method
- Initialize variable to contain all substrings
- Select for even numbered substrings
- Return count 
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
def even_substrings(str)
  substrings = find_all_substrings(str)

  substrings.select { |substring| substring.to_i.even? }.size
end

# # alternative
# def even_substrings(str)
#   substrings = find_all_substrings(str)

#   substrings.count { |substring| substring.to_i.even? }
# end

p even_substrings('1432') == 6
p even_substrings('3145926') == 16
p even_substrings('2718281') == 16
p even_substrings('13579') == 0
p even_substrings('143232') == 12