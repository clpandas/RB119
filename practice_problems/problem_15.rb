=begin
problem: Given a string of digits, return the greatest product of four consecutive digits from input string
rules/req:
- input will always have more than 4 digits

EX
'1828172' -> 1828, 8281, 2817, 8172 -> 1 * 8 * 2 * 8 --> 128

DS
in: string of digits
out: integer representing greatest product of four consecutive digits
int: array containing all possible 4 consecutive digits

high level
find all possible 4 consecutive digit possibilities, find and return greatest product

algorithm
- helper method: find all possible 4 consecutive digits
- initialize a variable to reference all possible 4 consecutive digits
- map through and transform possibilities to their product
- return greatest product
=end

def find_four_consecutive_digits(str)
  result = []
  (0...str.size - 3).each do |i|
    result << str[i, 4]
  end

  result
end

def greatest_product(str)
  possibilities = find_four_consecutive_digits(str)

  possibilities.map { |el| el.to_i.digits.reduce(:*) }.max
end

p greatest_product('23456') == 360      # 3 * 4 * 5 * 6
p greatest_product('3145926') == 540    # 5 * 9 * 2 * 6
p greatest_product('1828172') == 128    # 1 * 8 * 2 * 8
p greatest_product('123987654') == 3024 # 9 * 8 * 7 * 6