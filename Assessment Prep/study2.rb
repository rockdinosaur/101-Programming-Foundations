# 109 June 27th

#Write a method named include? that takes an Array and a search value as
#arguments. This method should return true if the search value is in the array,
#false if it is not. You may not use the Array#include? method in your solution.
def include?(arr, search)
  arr.each do |element|
    if element == search
      return true
    end
  end
  false
end

# iterate through the array
# if a value in the array matches the search value, return true

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false


################
#
# Write a method that computes the difference between the square of the sum of
# the first n positive integers and the sum of the squares of the first n positive
# integers.
#
# Examples:
#

def sum_square_difference(n)
  square_of_sums = (1..n).inject(:+) ** 2
  sum_of_squares = (1..n).inject {|sum, num| sum + (num ** 2)}
  square_of_sums - sum_of_squares
end

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150

# Create a method that takes two integers as arguments. The first argument is
# a count, and the second is the first number of a sequence that your method
# will create. The method should return an Array that contains the same number
# of elements as the count argument, while the values of each element will be
# multiples of the starting number.

# You may assume that the count argument will always have a value of 0 or
# greater, while the starting number can be any integer value.
# If the count is 0, an empty list should be returned

def sequence(multiple, starting_num)
  return [] if multiple == 0
  counter = 1
  array = []
  loop do
    array << counter * starting_num
    counter += 1
    break if counter > multiple
  end
  array
end


p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []
