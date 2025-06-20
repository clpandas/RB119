=begin
You have to create a method that takes a positive integer number and returns the next bigger number formed by the same digits:

EX
12 ==> 21
513 ==> 531
2017 ==> 2071
if no bigger number can be composed using those digits, return -1
9 ==> -1
111 ==> -1
531 ==> -1

123456789 -> all beginning digits the same, last two digits are reversed (if the right digit is greater than the left digit --> 123456798

DS
in: integer
out: integer representing the next bigger number consisting of the same digits as input num, or -1 if there is no next bigger num
int: convert integer to string, then to array of digits for comparison

algorithm
- convert input num to an array of digits
- go from right to left, checking for the first digit that is smaller than the digit to its right
- if no digit is found, return -1
- from the right end, find the smallest digit that is larger than the previously found digit- swap them
- after swapping, reorganize digits to the right of the swapped digits in the lowest order
=end

def next_bigger_num(num)
  digits = num.to_s.chars
  i = digits.size - 2
  while i >= 0 && digits[i] >= digits[i + 1]
    i -= 1
  end

  return -1 if i < 0 

  j = digits.size - 1
  j -= 1 until digits[j] > digits[i]

  digits[i], digits[j] = digits[j], digits[i]

  digits[(i + 1)..-1] = digits[(i + 1)..-1].sort

  digits.join.to_i
end

# # another solution
# def find_digit_match(checking_num, target_num)
#   target_digits = target_num.digits.sort
#   checking_digits = checking_num.digits.sort

#   target_digits == checking_digits
# end

# def next_bigger_num(num)
#   max_num = num.digits.sort { |a, b| b <=> a }.join.to_i
#   return -1 if num.to_s.size == 1 ||
#                num.digits.uniq.size == 1 ||
#                num == max_num
#   (num + 1..max_num).each do |n|
#     return n if find_digit_match(n, num)
#   end
# end 

p next_bigger_num(9) == -1
p next_bigger_num(12) == 21
p next_bigger_num(513) == 531
p next_bigger_num(2017) == 2071
p next_bigger_num(123456789) == 123456798
p next_bigger_num(111) == -1
p next_bigger_num(531) == -1