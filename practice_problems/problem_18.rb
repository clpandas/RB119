=begin
problem: Given an array of integers as input, return the index N where all nums with an index less than N sum to the same value as the nums with an index greater than N
reworded: find the index where everything to the left adds up to the same total as everything on the right
reworded again: find the place in the array where the sum of all the numbers before it equals the sum of all numbers after it
Return -1 if no index would make this happen
rules/req:
- sum of nums to left of index 0 is 0
- sum of nums to right of last element is 0
- if multiple indices meet this condition, return the smallest one
  - e.g. [|0|, 20, 10, -60, 5, 25] or [0, 20, 10, |-60|, 5, 25] --> return index 0

EX
[1, 2, 4, |4|, 2, 3, 2] -> sum(1, 2, 4) = 7, sum(2, 3, 2) = 7   --> idx 3
[7, |99|, 51, -48, 0, 4] -> sum(7) = 7, sum(51, -48, 0, 4) = 7 --> idx 1
[|17|, 20, 5, -60, 10, 25] -> sum(20, 5, -60, 10, 25) = 0  --> 0
[0, 2, 4, 4, 2, 3, 2] -> --> -1

DS
in: array of integers
out: an integer representing the spot (index) in the array where all numbers before that spot are equal to the numbers after that spot
intermediate: iteration to check each index, sum subarrays for comparison

high level
- iterate through each index in the array and return the first one where the sum of elements before it equal the sum of elements after it

algorithm
- Iterate through each index of input array
  - for each index
    - calculate left sum left_sum = arr[0...i]
    - calculate right sum right_sum = arr[i + 1..-1]
  - return index if left_sum == right_sum
return -1 if loop completes without finding a match
=end

def equal_sum_index(arr)
  arr.each_index do |i|
    left_sum = arr[0...i].sum
    right_sum = arr[i + 1..-1].sum
    return i if left_sum == right_sum
  end
  -1
end

p equal_sum_index([1, 2, 4, 4, 2, 3, 2]) == 3
p equal_sum_index([7, 99, 51, -48, 0, 4]) == 1
p equal_sum_index([17, 20, 5, -60, 10, 25]) == 0
p equal_sum_index([0, 2, 4, 4, 2, 3, 2]) == -1

# The following test case could return 0 or 3. Since we're
# supposed to return the smallest correct index, the correct
# return value is 0.
p equal_sum_index([0, 20, 10, -60, 5, 25]) == 0