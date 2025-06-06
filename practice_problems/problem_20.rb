=begin
problem: Given an array of numbers, return the number that only appears once
rules/req:
- all numbers in array are the same except one number
- array will always contain at least 3 numbers
- there will always be exactly one number that is different

EX
[0, 1, 0] -> 0: 2, 1: 1 --> 1 freq
[0, 1, 0] -> 0, 1, 0 => return number that didn't repeat --> 1
[7, 7, 7, 7.7, 7] -> 7, 7, 7, 7.7 => return number that didn't repeat --> 7.7

DS
in: array of integers
out: integer representing number that appears once
int: 
- track number freq in hash
- iterate through array to collect occurences

high level
- track frequency of numbers, return number that appears once
- use tracking variables to count number of occurencer, return the number that appears once, after finding a number that appears multiple times
- identify repeating number, return number that is not repeating

algorithm
- Define a variable `num1` and `num2` set to empty arrays to track occurences of numbers
- Iterate through array of nums
  - if current num is in num1, return num2 unless num2 is empty
  - elsif current num is in num2, return num1 unless num1 is empty
=end

def what_is_different(arr)
  arr.tally.key(1)
end

# alternative
# def what_is_different(arr)
#   num1 = []
#   num2 = []

#   arr.each do |num| 
#     if num1.include?(num)
#       return num2[0] unless num2.empty?
#     elsif num2.include?(num)
#       return num1[0] unless num1.empty?
#     elsif num1.empty?
#       num1 << num
#     else
#       num2 << num
#     end
#   end
# end

# # alternative
# def what_is_different(arr)
#   repeated_num = case
#                  when arr[0] == arr[1] then arr[0]
#                  when arr[0] == arr[2] then arr[0]
#                  else arr[1]
#                  end
#   arr.find { |num| num != repeated_num }
# end

p what_is_different([0, 1, 0]) == 1
p what_is_different([7, 7, 7, 7.7, 7]) == 7.7
p what_is_different([1, 1, 1, 1, 1, 1, 1, 11, 1, 1, 1, 1]) == 11
p what_is_different([3, 4, 4, 4]) == 3
p what_is_different([4, 4, 4, 3]) == 3