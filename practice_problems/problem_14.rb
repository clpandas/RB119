=begin
problem: Given a single integer input, return the sum of all multiples of 7 and 11 that are less than the input
rules/req:
- if a number is a multiple of both 7 and 11, count it just once
- if input is negative return 0 (GC?)

EX
(25) -> 7, 11, 14, 21, 22 --> 75 
(0) --> 0
(-100) --> 0
(11) -> 7 --> 7
(12) -> 7, 11 --> 18

DS
in: integer
out: integer representing sum of multiples
int: 
- iterating over a range from 1 to one less than input num to find multiples
- array containing multiples 

high level
collect and sum an array of multiples of 7 and 11 that are less than target num

algorithm
- Define an empty array to collect multiples
- Iterate through a range from 1 to one less than input num
  - If the num is a multiple of 7 or 11, push to multiples array
- Sum multiples array
=end

def seven_eleven(target_num)
  # return 0 if target_num <= 0
  # return 0 if target_num.negative?
  
  multiples = []
  (1...target_num).each do |num|
    multiples << num if num % 7 == 0 || num % 11 == 0
  end

  multiples.sum
end

p seven_eleven(10) == 7
p seven_eleven(11) == 7
p seven_eleven(12) == 18
p seven_eleven(25) == 75
p seven_eleven(100) == 1153
p seven_eleven(0) == 0
p seven_eleven(-100) == 0