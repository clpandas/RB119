=begin
Problem: Given an array of integers, return an array of the two numbers with the smallest value difference
Rules/Req:
- If there are multiple pairs that are equally close, return the pair that comes first in the array
- numbers do not need to be adjacent

Examples
[12, 22, 7, 17] --> [12, 7] difference of 5

DS
in: array of integers
out: 2 element array of numbers with the smallest value difference
int:
  - array of all combinations of 2 to compare differences

high level
- find all possible pairs
- sort pairs by absolute difference of pairs in ascending order
- return first element

algorithm
- find all pairs helper method
- initialize a variable to reference all pairs
- sort through all pairs by absolute difference
- return first element

find all pairs helper method
- initialize a result array to build into
- iterate over a range representing the a starting index (up to 2 before the end)
  - for each starting index
    - iterate over a range representing an ending index
      - use element access to push pairs into result array
- return result
=end

# find all pairs helper method
def find_all_pairs(arr)
  result = []

  (0...arr.size - 1).each do |i|
    (i + 1...arr.size).each do |j|
      result << [arr[i], arr[j]]
    end
  end

  result
end

# main method
def closest_numbers(arr)
  pairs = find_all_pairs(arr)
  pairs.sort_by { |pair| (pair[0] - pair[1]).abs }.first
end

p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 22, 7, 17]) == [12, 7]