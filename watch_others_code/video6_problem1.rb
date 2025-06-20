=begin
You are going to be given an array of integers.
Your job is to take that array and find an index N where the sum of the integers to the left of N is equal to the sum of the integers to the right of N. 
If there is no index that would make this happen, return -1.

For example:
Let's say that you are given the array [1, 2, 3, 4, 3, 2, 1]:
Your method will retun the index 3 because at the 3rd position of the array, the sum of the left side of the index [1, 2, 3] and the sum of the right side of the index [3, 2, 1] both equal 6.

Another one:
You are given the array [20, 10, -80, 10, 10, 15, 35]
At the index 0 the left side is []
The right side is [10, -80, 10, 10, 15, 35]
They both are equal to 0 when added. (Empty arrays are equal to 0 in this problem)
Index 0 is the place where the left side and right side are equal

Your job is to take that array and find an index N where the sum of the integers to the left of N is equal to the sum of the integers to the right of N

problem: given an array of integers, return the index position from the array where the sum of the numbers to the left of the index is equal to the sum of the numbers to the right of the index
- return -1 if no index could make this happen
- do not include num at index in calculations

[1, 2, 3, 4, 3, 2, 1] -> 
idx0 iteration 1 
L sum: 0
R sum: 15 
idx1 iteration 2
L sum: 1
R sum: 13
idx2 iteration 3
L sum: 3
R sum: 10
idx3 iteration 4 
L sum: 6
R sum: 6
idx3 --> 3

DS
in: array of integers
out: integer representing an index position 
int: iterate through the array comparing sum of left nums to sum of right nums

algorithm
- iterate through array with an index
  - initialize left_sum variable set to the sum of slicing into the array from the beginning to the index position (exlusive)
  - initialize right_sum variable set to the sum of slicing into the array from the index position plus 1 to the end of the array
  - for each number, check sum of left vs sum of right
  - return index position if left_sum == right_sum
- else return -1
=end

def find_even_index(arr)
  arr.each_with_index do |num, idx|
    left_sum = arr[...idx].sum
    right_sum = arr[idx + 1..].sum

    return idx if left_sum == right_sum
  end

  -1
end

p find_even_index([1, 2, 3, 4, 3, 2, 1]) == 3
p find_even_index([1, 100, 50, -51, 1, 1]) == 1
p find_even_index([1, 2, 3, 4, 5, 6]) == -1
p find_even_index([20, 10, 30, 10, 10, 15, 35]) == 3
p find_even_index([20, 10, -80, 10, 10, 15, 35]) == 0
p find_even_index([10, -80, 10, 10, 15, 35, 20]) == 6
p find_even_index([-1, -2, -3, -4, -3, -2, -1]) == 3