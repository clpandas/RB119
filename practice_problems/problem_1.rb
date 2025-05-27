=begin
Problem: Given an array of numbers, return an array where each value is replaced by the count of how many numbers from the rest of the array are smaller than it
- When counting numbers, only count unique values -- if a number occurs multiple times in the array, it should only be counted once

Example
[8, 1, 2, 2, 3] --> [3, 0, 1, 1, 2]
[7, 7, 7, 7] --> [0, 0, 0, 0]
[1] --> [0]

DS
in: array of integers
out: array of new integers
int: iterate through input array to produce output array

High level
- Use the unique values from the array to compare against each original number
  - For each number in the input, count how many unique numbers are smaller

  Algorithm
- Define a new array `unique_nums` of only unique numbers from the input array
- Define an empty `result` array to build into
- Iterate over each number in the input array
  - Initialize a counter to 0
  - Iterate over the `unique_nums` to compare each element
    - If the unique number is smaller than the current number, increment the counter
  - Append the counter to the `result` array
- Return the `result` array
=end

# # Iteration 1
# def smaller_numbers_than_current(arr)
#   unique_nums = arr.uniq
#   result = []

#   arr.each do |current_num|
#     counter = 0
#     unique_nums.each { |unique_num| counter += 1 if unique_num < current_num }
#     result << counter
#   end

#   result
# end

# # Iteration 2: with `map`
# def smaller_numbers_than_current(arr)
#   unique_nums = arr.uniq

#   arr.map do |current_num|
#     counter = 0
#     unique_nums.each { |unique_num| counter += 1 if unique_num < current_num }
#     counter
#   end
# end

# Iteration 3: with `count`

def smaller_numbers_than_current(arr)
  unique_nums = arr.uniq

  arr.map do |current_num|
    unique_nums.count { |unique_num| unique_num < current_num }
  end
end

p smaller_numbers_than_current([8, 1, 2, 2, 3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([7, 7, 7, 7]) == [0, 0, 0, 0]
p smaller_numbers_than_current([6, 5, 4, 8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]

my_array = [1, 4, 6, 8, 13, 2, 4, 5, 4]
result   = [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current(my_array) == result