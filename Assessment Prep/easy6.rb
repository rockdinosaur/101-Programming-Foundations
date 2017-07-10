# Cute Angles
def dms(num)
  dms = num % 360

  d = dms.floor
  m = format('%02d', (dms % 1 * 60).round(3).floor)
  s = format('%02d', ((dms % 1 * 60).round(3) % 1 * 60).round)


  %(#{d}°#{m}'#{s}")
end

def dms2(num)
  dms = num % 360

  degrees, decimal1 = dms.divmod(1)
  minutes, decimal2 = (decimal1.round(10) * 60).divmod(1)
  seconds = decimal2 % 1 * 60.round(10)

  %(#{degrees}°#{format("%02d", minutes)}'#{format("%02d", seconds)}")
end

# p dms(30) == %(30°00'00")
# p dms(76.73) == %(76°43'48")
# p dms(254.6) == %(254°36'00")
# p dms(93.034773) == %(93°02'05")
# p dms(0) == %(0°00'00")
# p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
#
# p dms2(30) == %(30°00'00")
# p dms2(76.73)
# p dms2(254.6) == %(254°36'00")
# p dms2(93.034773)
# p dms2(0) == %(0°00'00")
# p dms2(360) == %(360°00'00") || dms(360) == %(0°00'00")

# Delete vowels
def remove_vowels(arr)
  arr.map do |word|
    word.delete('aeiouAEIOU')
  end
end

# p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
# p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
# p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

# Fibonacci Number Location By Length
def find_fibonacci_index_by_length(length)
  fibonacci_sequence(length).size
end

def fibonacci_sequence(length)
  prev_fib_num1 = 0
  prev_fib_num2 = 0
  fib_num = 1
  fib_array = []
  loop do
    fib_array << fib_num
    break if fib_num.to_s.length == length
    prev_fib_num2 = prev_fib_num1
    prev_fib_num1 = fib_num
    fib_num = prev_fib_num1 + prev_fib_num2
  end
  fib_array
end
#
# p find_fibonacci_index_by_length(2) == 7
# p find_fibonacci_index_by_length(10) == 45
# p find_fibonacci_index_by_length(100) == 476
# p find_fibonacci_index_by_length(1000) == 4782
# p find_fibonacci_index_by_length(10000) == 47847

# Reversed Arrays (Part 1)
def reverse!(arr)
  counter = 0
  (arr.length / 2).times do
    first = arr[counter]
    last = arr[-1-counter]

    arr[counter] = last
    arr[-1-counter] = first
    counter += 1
  end
  arr
end

list = [1,2,3,4]
result = reverse!(list) # => [4,3,2,1]
p list
p list.object_id == result.object_id

list = %w(a b c d e)
reverse!(list) # => ["e", "d", "c", "b", "a"]
p list == ["e", "d", "c", "b", "a"]

list = ['abc']
reverse!(list) # => ["abc"]
p list

list = []
reverse!(list) # => []
p list

# Reversed Arrays (Part 2)
def reverse(arr)
  reversed_array = []
  counter = 0
  loop do
    break if arr == []
    reversed_array << arr[-1-counter]
    counter += 1
    break if counter >= arr.length
  end
  reversed_array
end

p reverse([1,2,3,4])         # => true
p reverse(%w(a b c d e)) == %w(e d c b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

list = [1, 2, 3]                      # => [1, 2, 3]
new_list = reverse(list)              # => [3, 2, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 2, 3]                     # => true
p new_list == [3, 2, 1]                 # => true

# Combining Arrays

def merge(arr1, arr2)
  (arr1+arr2).uniq
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

# Halvsies
def halvsies(arr)
  first_half = []
  second_half = []

  arr.each_with_index do |ele, index|
    if arr.length.even?
      if index < (arr.length/2)
        first_half << ele
      else
        second_half << ele
      end
    else
      if index < (arr.length/2 + 1)
        first_half << ele
      else
        second_half << ele
      end
    end
  end
  [first_half, second_half]
end

def halvsies2(arr)
  first_half = arr[0..((arrlength / 2) - 1)]
  second_half = arr[(arr.length / 2)..-1]
  [first_half, second_half]
end

p halvsies([1, 2, 3, 4])
p halvsies([1, 5, 2, 4, 3])
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]
p halvsies([1, 2, 3, 4, 5, 6, 7, 8, 9])

# Find the Duplicate
def find_dup(arr)
  arr.select { |num| arr.count(num) > 1 }.first
end

def find_dup2(arr)
  arr.find { |num| arr.count(num) > 1 }
end


p find_dup2([1, 5, 3, 1]) == 1
p find_dup2([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73


# Does My List Include This?
def include?(arr, search_value)
  arr.each do |num|
    if num == search_value
      return true
    end
  end
  false
end


p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false

# Right Triangles
def triangle(n)
  stars = 1
  loop do
    puts " " * (n - stars) + "*" * stars
    stars += 1
    break if stars > n
  end
end

triangle(5)
triangle(9)
