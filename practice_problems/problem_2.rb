=begin
Problem: Given an array of integers, return the minimum sum of 5 consecutive numbers in the input array
- return `nil` if the array has less than 5 elements

Examples
[1, 2, 3, 4] --> nil
[1, 2, 3, 4, 5, -5] --> 9 
[1, 2, 3, 4, 5] -> 15 
& 
[2, 3, 4, 5, -5] -> 9

DS
in: array of integers
out: integer (minimum sum)
int: generate an array of sums from possible 5 consecutive element arrays

High level
- Find all possible consecutive 5 element arrays
- Sum array values
- Return minimum sum

Algorithm
- Given a method `minimum_sum` that takes an array of integers as input
- Return `nil`if the size of the array is less than 5
- Define `find_five_consecutive_nums` helper method
- Define a variable to contain all possible 5 consecutive numbers from input array
- Return the minimun sum of the possible 5 consecutive numbers arrays
=end

def find_five_consecutive_nums(arr)
  result = []
  (0...arr.size - 4).each do |i|
    result << arr[i, 5]
  end

  result
end

def minimum_sum(arr)
  return nil if arr.size < 5
  five_consecutive_nums = find_five_consecutive_nums(arr)

  five_consecutive_nums.map(&:sum).min
end

p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, -5]) == 9
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10