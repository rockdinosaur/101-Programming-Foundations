# Odd
def is_odd?(num)
  num.odd?
end

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)

# List of Digits
def digit_list(num)
  num.to_s.chars.map(&:to_i) # same as num.to_s.chars.map {|digit| digit.to_i}
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]

# How Many?
def count_occurrences(arr)
  unique_arr = arr.uniq
  unique_arr.each do |item|
    puts "#{item} => #{arr.count(item)}"
  end
end

vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']

count_occurrences(vehicles)

# Reverse It (pt1)
def reverse_sentence(string)
  counter = 1
  reversed_string_array = []
  if string == ''
    string
  else
    loop do
      reversed_string_array << string.split[string.split.length - counter]
      counter += 1
      break if counter > string.split.length
    end
  end
  reversed_string_array.join(' ')
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'

# Reverse It (pt2)
def reverse_words(str)
  reversed_array = str.split.map do |word|
                    if word.length > 5
                      word.reverse
                    else
                      word
                    end
                  end
  reversed_array.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS

# Stringy Strings
def stringy(num)
  binary = '1'
  (num - 1).times do |counter|
    binary << '0' if counter.even?
    binary << '1' if counter.odd?
  end
  binary
end


puts stringy(6)
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

# Array Average
def average(arr)
  sum = arr.reduce(:+)
  sum / arr.length
end

puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

# Sum of Digits
def sum(num)
  sum = 0
  num.to_s.each_char do |digit|
    sum += digit.to_i
  end
  sum
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

# What's my Bonus?
def calculate_bonus(salary, decision)
  decision ? (salary / 2) : 0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000
