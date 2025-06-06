=begin
problem: given an array of integers, return the integer that appears an odd number of times
rules/req:
- there will always be one integer that appears an odd number of times
- given one element, return that single element

EX
[7, 99, 7, 51, 99] -> 7: 2, 99: 2, |51: 1|--> 51

DS
in: array of integers
out: integer representing the one that appears an odd number of times
int: hash to contain the frequency count of character appearences

high level 
find the frequency count of different integers, return the integer that appears an odd count

algorithm
- Define a hash containing the frequency count of the integer occurences
- Return the key of the value that is odd from the hash
=end

def odd_fellow(arr)
  arr.tally.select { |k, v| v.odd? }.keys.first
# arr.tally.select { |k, v| v.odd? }.first[0]
end

# # alternative: manual `tally`, `find` on hash
# def odd_fellow(arr)
#   freq = Hash.new(0)
#   arr.each { |num| freq[num] += 1 }
#   freq.find { |_, count| count.odd? }.first
# end


# # alternative
# def odd_fellow(arr)
#   arr.find { |num| arr.count(num).odd? }
# end

p odd_fellow([4]) == 4
p odd_fellow([7, 99, 7, 51, 99]) == 51
p odd_fellow([7, 99, 7, 51, 99, 7, 51]) == 7
p odd_fellow([25, 10, -6, 10, 25, 10, -6, 10, -6]) == -6
p odd_fellow([0, 0, 0]) == 0