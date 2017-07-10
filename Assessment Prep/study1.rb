# Create a method that takes two integers as arguments. The first argument is a
# count, and the second is the first number of a sequence that your method will
# create. The method should return an Array that contains the same number of
# elements as the count argument, while the values of each element will be
# multiples of the starting number.

# You may assume that the count argument will always have a value of 0 or
# greater, while the starting number can be any integer value. If the count is
# 0, an empty list should be returned.

# Examples:
def sequence(size, step)
  arr = []
  1.upto(size) { |num| arr << num * step }
  arr
end

# def sequence(size, step)
#   (1..size).map { |num| num * step }
# end


p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []
# Examples:

# p short_long_short("abc", "defgh") == "abcdefghabc"
# p short_long_short("abcde", "fgh") == "fghabcdefgh"
# p short_long_short("", 'xyz') == "xyz"

# def short_long_short(*strings)
#   shortest = strings.min_by { |str| str.size }
#   longest = strings.max_by { |str| str.size }
#   shortest + longest + shortest
# end
