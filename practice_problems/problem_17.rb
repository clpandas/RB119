=begin
problem: given an array of integers, return the minimum integer value to be appended to the array so the sum of all elements equals the closest prime num that is greater than the current sum
rules/req:
- The array will always contain at least 2 integers.
- All values in the array must be positive (> 0).
- There may be multiple occurrences of the various numbers in the array.
- if the sum of array is prime, continue to the next prime number

EX
[1, 2, 3] -> sum: 6, nearest prime: 7, difference: 1 --> 1

DS
in: array of integers
out: integer representing difference between sum of array of nearest prime num
int: - boolean true or false if a num is prime

high level/alg
- helper method: determine if num is prime
- sum nums in arr
- increment sum until find prime number
- return differnce of prime num and sum

prime num helper method
- return false if num is 1 or less
- iterate through a range from 2 up to the square root of num
  - return true if no divisible numbers are found
=end

def is_prime?(num)
  return false if num <= 1
  (2..Math.sqrt(num)).none? { |n| num % n == 0 }
end

def nearest_prime_sum(arr)
  sum = arr.sum
  sum_tracker = sum

  loop do
    sum_tracker += 1
    break if is_prime?(sum_tracker)
  end

  sum_tracker - sum
end

p nearest_prime_sum([1, 2, 3]) == 1        # Nearest prime to 6 is 7
p nearest_prime_sum([5, 2]) == 4           # Nearest prime to 7 is 11
p nearest_prime_sum([1, 1, 1]) == 2        # Nearest prime to 3 is 5
p nearest_prime_sum([2, 12, 8, 4, 6]) == 5 # Nearest prime to 32 is 37

# Nearest prime to 163 is 167
p nearest_prime_sum([50, 39, 49, 6, 17, 2]) == 4