=begin
Problem: Given an array of integers as input, return an integer representing the count of identical pairs of integers from the input array
Rules/req:
- if array contains exactly 1 value or less return 0 (return 0 if arr.size <= 1)
- count every complete pair, even for multiple pairs of the same number 

EX
[1, 1, 1, 1] --> 2
[2, 2, 2, 2, 2] --> 2 (with one incomplete pair)

DS
in: array of integers
out: integer representing the count of identical pairs
int:
- an array to track potential pairs
- a counter variable

high level
use array to track potential pairs by cancelling out occurences and incrementing count, return count of potential pairs

algorithm
- Define an empty array to track potential pairs
- Define a counter variable to track pairs initialized to 0
- Iterate over input array
  - if current num exists in tracking array, delete (mutate) num from tracking array and increment counter
  - elsif current num does not exist in tracking array, push num to tracking array 
- Return count
=end

def pairs(arr)
  potential_pairs = []
  count = 0

  arr.each do |num|
    if potential_pairs.include?(num)
      potential_pairs.delete(num)
      count += 1
    else
      potential_pairs << num
    end
  end
  
  count
end

# # another solution
# def pairs(arr)
#   count = 0
#   values = arr.tally.values

#   values.each do |value|
#     count += value / 2
#   end

#   count
# end


p pairs([3, 1, 4, 5, 9, 2, 6, 5, 3, 5, 8, 9, 7]) == 3
p pairs([2, 7, 1, 8, 2, 8, 1, 8, 2, 8, 4]) == 4
p pairs([]) == 0
p pairs([23]) == 0
p pairs([997, 997]) == 1
p pairs([32, 32, 32]) == 1
p pairs([7, 7, 7, 7, 7, 7, 7]) == 3