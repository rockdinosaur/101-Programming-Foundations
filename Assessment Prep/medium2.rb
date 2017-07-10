# Longest Sentence

 text = File.read('84.txt')
# text = "Four score and seven years ago our fathers brought forth
# on this continent a new nation, conceived in liberty, and
# dedicated to the proposition that all men are created
# equal.
#
# Now we are engaged in a great civil war, testing whether
# that nation, or any nation so conceived and so dedicated,
# can long endure. We are met on a great battlefield of that
# war. We have come to dedicate a portion of that field, as
# a final resting place for those who here gave their lives
# that that nation might live. It is altogether fitting and
# proper that we should do this.
#
# But, in a larger sense, we can not dedicate, we can not
# consecrate, we can not hallow this ground. The brave
# men, living and dead, who struggled here, have
# consecrated it, far above our poor power to add or
# detract. The world will little note, nor long remember
# what we say here, but it can never forget what they
# did here. It is for us the living, rather, to be dedicated
# here to the unfinished work which they who fought
# here have thus far so nobly advanced. It is rather for
# us to be here dedicated to the great task remaining
# before us -- that from these honored dead we take
# increased devotion to that cause for which they gave
# the last full measure of devotion -- that we here highly
# resolve that these dead shall not have died in vain
# -- that this nation, under God, shall have a new birth
# of freedom -- and that government of the people, by
# the people, for the people, shall not perish from the
# earth."
# iterate through every word
# if word ends with . ? !, count how many words led up to that point
# if number of words > longest_sentence, that sentence = longest_sentence
sentence = []
longest_sentence = []
text.split.each do |word|
  sentence << word
  if word.end_with?('!','.','?')
    if sentence.length > longest_sentence.length
      longest_sentence = sentence
      sentence = []
    else
      sentence = []
    end
  end
end
p longest_sentence.length

# Now I Know My ABCs


# iterate through letters of the given word
# if letter matches one of those in a sub array, delete that subarray
# if no matches, return false

def block_word?(str)
  abc_blocks = [
    ['B', 'O'],
    ['X', 'K'],
    ['D', 'Q'],
    ['C', 'P'],
    ['N', 'A'],
    ['G', 'T'],
    ['R', 'E'],
    ['F', 'S'],
    ['J', 'W'],
    ['H', 'U'],
    ['V', 'I'],
    ['L', 'Y'],
    ['Z', 'M']
  ]

  str.upcase.chars.each do |letter|
    abc_blocks.each_with_index do |subarr, index|
      if subarr.include?(letter)
        abc_blocks.delete_at(index)
        break
      elsif !abc_blocks.flatten.include?(letter)
        return false
      end
    end
  end
  true
end

p block_word?('BATCH')
p block_word?('BUTCH') == false
p block_word?('jest') == true


# test = 'a'
#
# case test
# when test.downcase
#   puts 'yay'
# else
#   puts ' :( '
# end

# Lettercase Percentage Ratio
def letter_percentages(str)
  # iterate through each character of input string
  # lowercase % = number of lowercase chars in string / string length
  percentages = Hash.new(0)
  lowercase = 0.0
  uppercase = 0.0
  neither = 0.0

  str.chars.each do |char|
    case char
    when ('a'..'z')
      lowercase += 1
    when ('A'..'Z')
      uppercase += 1
    else
      neither += 1
    end
  end
  percentages[:lowercase] = ((lowercase / str.length) * 100).round(1)
  percentages[:uppercase] = ((uppercase / str.length) * 100).round(1)
  percentages[:neither] = ((neither / str.length) * 100).round(1)

  percentages.each do |key, value|
    if value % 1 == 0
      percentages[key] = value.to_i
    end
  end
end

p letter_percentages('abCdef 123')
p letter_percentages('AbCd +Ef')
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }

# Matching Parentheses?

def balanced?(str)
  left_brackets = 0
  right_brackets = 0
  str.chars.each do |char|
    left_brackets += 1 if char == "("
    right_brackets += 1 if char == ")"
    return false if right_brackets > left_brackets
  end
  return true if left_brackets == right_brackets
  false
end

# iterate through each character of the string
# increment left bracket counter when char == (
# increment right bracket counter when char == )
# if at anytime right bracket counter > left bracket counter, return false
# p balanced?('What (is) this?') == true
# p balanced?('What is) this?') == false
# p balanced?('What (is this?') == false
# p balanced?('((What) (is this))?') == true
# p balanced?('((What)) (is this))?') == false
# p balanced?('Hey!') == true
# p balanced?(')Hey!(') == false
# p balanced?('What ((is))) up(') == false

# Triangle Sides
def triangle(a, b, c)
  return :invalid if (a == 0 || b == 0 || c == 0) || ((([a, b, c].max).to_f / [a, b, c].inject(:+)) > 0.5 )
  if a == b && b == c
    :equilateral
  elsif a != b && b != c && c != a
    :scalene
  else
    :isosceles
  end
end

# p triangle(3, 3, 3) == :equilateral
# p triangle(3, 3, 1.5) == :isosceles
# p triangle(3, 4, 5) == :scalene
# p triangle(0, 3, 3) == :invalid
# p triangle(3, 1, 1) == :invalid

# Tri-Angles

def triangle2(a, b, c)
  angles = [a, b, c]
  return :invalid if angles.any? {|angle| angle <= 0} || angles.inject(:+) != 180
  if angles.any? {|angle| angle == 90}
    return :right
  elsif angles.all? {|angle| angle < 90}
    return :acute
  else
    return :obtuse
  end
end


# p triangle2(60, 70, 50) == :acute
# p triangle2(30, 90, 60) == :right
# p triangle2(120, 50, 10) == :obtuse
# p triangle2(0, 90, 90) == :invalid
# p triangle2(50, 50, 50) == :invalid

# Unlucky Days
require 'Date'

def friday_13th(year)
# given a year, iterate through all the days
# if day is friday and also the 13th, increment black friday counter
month = 1
unlucky_days = 0
  12.times do
    unlucky_days += 1 if Date.new(year,month,13).friday?
    month += 1
  end
unlucky_days
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2

# Next Featured Number Higher than a Given Value

def featured(min)
  # if min is even, increment it by 1 and check if it's a featured number
  # if not, keep incrementing by 2 until true
  # if min is odd, increment by 2 at a time until we hit a featured number
  # featured num is divisible by 7, odd, and digits occur only once
  return "There is no number that fulfills those requirements" if min > 9_876_543_210
  if min.even?
    min += 1
    if min.to_s.chars.uniq.join('').to_i == min && min % 7 == 0
      return min
    else
      loop do
        min += 2
        return min if (min.to_s.chars.uniq.join('').to_i == min) && (min % 7 == 0)
      end
    end
  else
    loop do
      min += 2
      return min if min.to_s.chars.uniq.join('').to_i == min && min % 7 == 0
    end
  end
end

# p featured(12) == 21
# p featured(20) == 21
# p featured(21) == 35
# p featured(997) == 1029
# p featured(1029) == 1043
# p featured(999_999) == 1_023_547
# p featured(999_999_987) == 1_023_456_987
#
# featured(9_999_999_999) # -> There is no possible number that fulfills those requirements

# Bubble Sort

# compare element 0 & 1
# swap if [0] is > [1]
# compared element 1 & 2
# swap if [1] > [2]
# etc
# save modified array into a var after each complete iteration
# repeat iteration and compare new sorted array with each previously saved version of the array
# if same, break out of the loop

def bubble_sort!(arr)
  sorted_arr = []
  current_element = ''
  next_element = ''

  loop do
    sorted_arr = arr.dup
    arr.each_with_index do |element, index|
      if element > arr[index + 1]
        current_element = element
        next_element = arr[index + 1]
        arr[index] = next_element
        arr[index + 1] = current_element
      end
      break if index >= arr.length - 2
    end

    break if sorted_arr == arr

  end
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]
#
array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

# Sum Square - Square Sum

def sum_square_difference(n)
  ((1..n).inject(:+)) ** 2 - (1..n).inject {|sum, n| sum + (n ** 2)}
end

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150
