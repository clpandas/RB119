=begin
The maximum sum subarray problem consists in finding the maximum sum of a contiguous subsequence in an array of integers:

maxSequence [-2, 1, -3, 4, -1, 2, 1, -5, 4]
-- should be 6: [4, -1, 2, 1]
Easy case is when the array is made up of only positive numbers and the maximum sum is the sum of the whole array.
If the array is made up of only negative numbers return 0 instead. 

Empty array is considered to have zero greatest sum. 
Note that the empty array is also a valid subarray.

problem: Given an array of positive and negative integers, return the max sum of a contiguous subsequence 
- if the array is all negative nums, return 0
- if array is empty, return 0

EX
[-2, 1, -3, 4, -1, 2, 1, -5, 4]) -> 
[[-2], [-2, 1], [-2, 1, -3]..
[1], [1, -3], [1, -3, 4]..] sum all sub arrays return max sum
--> 6

0..0, 0..1, 0..2 .. 0..arr.size - 1
1..1, 1..2, 1..3 .. 1..arr.size - 1

DS
in: array of integers pos and neg
out: integer representing max sum of contiguous subarr
int: find all subarrays, sum subarrays

algorithm
- helper method: find all subarrays
- transform subarrays to their sum total
- return max

find all subarrays 
-define a result arr to build into
- iterate through a range from 0 to the size of array minus 1 to get the start index
  - iterate through a range from the start index to the size of the array minus 1 to get the end index
- slice into arr using a range with the start_i and end_i then push subarr slice to result arr
- return resultl arr
=end

def find_all_subsequences(arr)
  result = []

  (0...arr.size).each do |start_i|
    (start_i...arr.size).each do |end_i|
      result << arr[start_i..end_i]
    end
  end
  result
end

def max_sequence(arr)
  return 0 if arr.all? { |num| num < 0 } || arr.empty?

  subsequences = find_all_subsequences(arr)
  subsequences.map(&:sum).max
end

p max_sequence([]) == 0
p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
p max_sequence([11]) == 11
p max_sequence([-32]) == 0
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12