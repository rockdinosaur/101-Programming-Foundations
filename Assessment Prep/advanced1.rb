# Madlibs Revisited

# Seeing Stars

def star(n)
  # grid is n x n
  # " " * 0 + "*" + " " * (n - 3 - 2 * counter)/2 + "*" + " " * (n - 3)/2 + "*" + " " * 0
  # " " * 1 + "*" + " " * (n - 3 - 2 * counter)/2 + "*" + " " * (n - 5)/2 + "*" + " " * 1
  # " " * 2 + "*" + " " * (n - 3 - 2 * counter)/2 + "*" + " " * (n - 7)/2 + "*" + " " * 2
  # ...
  # (n-1)/2 times
  # "*" * 9

  0.upto((n - 1) / 2 - 1) do |counter|
    puts (" " * counter) + "*" + (" " * ((n - 3 - 2 * counter) / 2)) + "*" + (" " * ((n - 3 - 2 * counter) / 2)) + "*" + (" " * counter)
  end
    puts "*" * n
  ((n - 1) / 2 - 1).downto(0) do |counter|
    puts " " * counter + "*" + " " * ((n - 3 - 2 * counter) / 2) + "*" + " " * ((n - 3 - 2 * counter) / 2) + "*" + " " * counter
  end
end

star(9)
star(7)


# Transpose 3x3
# matrix[x][y] becomes matrix[y][x]

# non-destructive
def transpose(matrix)
  columns = matrix[0].size
  rows = matrix.size
  t_matrix = Array.new(columns) {Array.new(rows, 0)}

  x = 0
  loop do
    matrix.each_with_index do |row, y|
      t_matrix[x][y] = matrix[y][x]
    end
    x += 1
    break if x >= columns
  end
  t_matrix
end
matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)
p new_matrix
p matrix
p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]

# destructive
def transpose!(matrix)
  (0...matrix.size).each do |x|
    (0...matrix.size).each do |y|
      matrix[x][y], matrix[y][x] = matrix[y][x], matrix[x][y] if y > x
    end
  end
  matrix
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

# new_matrix = transpose!(matrix)
# p new_matrix
# p matrix

# Rotating Matrices

# rows become columns and columns become rows
# specifically, the first row becomes the last column
# second row becomes the 2nd last column
# etc... last row becomes 1st column

def rotate90(matrix)
  columns = matrix.size
  rows = matrix.first.size
  r_row = []
  r_matrix = []

  0.upto(matrix.first.size - 1) do |y|
    r_row = []
    0.upto(matrix.size - 1) do |x|
      r_row << matrix[x][y]
    end
    r_matrix << r_row.reverse
  end
  r_matrix
end


matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2

# Fix the Bug
def my_method(array)
  if array.empty?
    []
  elsif array.size > 1
    array.map do |value|
      value * value
    end
  else
    [7 * array.first]
  end
end

p my_method([]) # => []
p my_method([3]) # => [21]
p my_method([3, 4]) # => [9, 16]
p my_method([5, 6, 7]) # => [25, 36, 49]

# Merge Sorted Lists

def merge(arr1, arr2)
  sorted = []

  counter1 = 0
  counter2 = 0

  loop do
    if arr1[counter1] == nil
      sorted << arr2[counter2]
      counter2 += 1
      break if sorted.length >= (arr1 + arr2).length
      next
    elsif arr2[counter2] == nil
      sorted << arr1[counter1]
      counter1 += 1
      break if sorted.length >= (arr1 + arr2).length
      next
    elsif (arr1[counter1] < arr2[counter2])
      sorted << arr1[counter1]
      counter1 += 1
      break if sorted.length >= (arr1 + arr2).length
      next
    elsif (arr2[counter2] < arr1[counter1])
      sorted << arr2[counter2]
      counter2 += 1
      break if sorted.length >= (arr1 + arr2).length
      next
    end
  end
  sorted
end

# iterate through first array
# if [0] is greater than 2[0]
# sorted << [0] and increment counter of arr1
# now compare [1] to 2[0]..etc
p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
# p merge([1, 4, 5], []) == [1, 4, 5]



# Merge Sort
# group array elements 2 at a time into sub arrays
# [slice(0..1)] slice(2..3) slice(4..5)..etc

# [a, b] => [[a], [b]]
# arr[0] => a
# arr[0] => [arr[0]]
# arr[1] => [arr[1]]
def merge_sort(array)
  return array if array.size == 1

  sub_array_1 = array[0...array.size / 2]
  sub_array_2 = array[array.size / 2...array.size]

  sub_array_1 = merge_sort(sub_array_1)
  sub_array_2 = merge_sort(sub_array_2)

  merge(sub_array_1, sub_array_2)
end

p merge_sort([6, 2, 7, 1, 4])

# Egyption Fractions

# def egyptian(target_value)
#   denominators = []
#   unit_denominator = 1
#   until target_value == 0
#     unit_fraction = Rational(1, unit_denominator)
#     if unit_fraction <= target_value
#       target_value -= unit_fraction
#       denominators << unit_denominator
#     end
#
#     unit_denominator += 1
#   end
#
#   denominators
# end
#
#
# p egyptian(Rational(3,5))

# if n = 3/5
# check 1/1, 1/2, 1/3, etc
# 1/1 is > n so move onto 1/2
# 1/2 is < n so store denominator into array
# subtract 1/2 from n --> 3/5 - 1/2 = 1/10
# 1/3 is > n so move onto 1/4
# 1/4 is > n so move onto 1/10
# etc until 1/10
# array: [2, 10]

def egyptian(n)
  denominator = 1
  egyptian = []
  until n == 0
    if Rational(1, denominator) > n
      denominator += 1
    else
      n -= Rational(1, denominator)
      egyptian << denominator
      denominator += 1
    end
  end
  egyptian
end

def unegyptian(arr)
  numerator = 1
  rational_number = Rational(0, 1)
  arr.each do |denominator|
    rational_number += Rational(numerator, denominator)
  end
  rational_number
end

p egyptian(Rational(2, 1))    # -> [1, 2, 3, 6]
p egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
p egyptian(Rational(3, 1))    # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

p unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
p unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
p unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
p unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)
