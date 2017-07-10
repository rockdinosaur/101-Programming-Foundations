# Welcome Stranger
def greetings(name_arr, info)
  name = name_arr.join(' ')
  title = info[:title]
  occupation = info[:occupation]

  "Hello, #{name}! Nice to have a #{title} #{occupation} around."
end

p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Hello, John Q Doe! Nice to have a Master Plumber around.

# Double Doubles
def twice(n)
  # if n's length is odd, double the number
  # if n's length is even, check if it's a double number
    # n is a double number if the first half == second half
  # if it's a oduble number, return it as it is, otherwise double it
  if n.to_s.length.odd? || !(n.to_i.to_s[0, (n.to_i.to_s.length / 2)] == n.to_i.to_s[n.to_s.length / 2, (n.to_i.to_s.length / 2)])
    return n * 2
  else
    return n
  end
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10

# Always Return Negative
def negative(n)
  n > 0 ? -n : n
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0      # There's no such thing as -0 in ruby

# Counting Up
def sequence(n)
  (1..n).to_a
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]

# Uppercase Check
def uppercase?(str)
  str.each_char {|char| return false if char == char.downcase && ('a'..'z').include?(char.downcase)}
  true
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true

# How long are you?
def word_lengths(str)
  str.split.each_with_object([]) do |word, arr|
    arr << "#{word} #{word.length}"
  end
end

p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

p word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

p word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

p word_lengths("") == []

# Name Swapping
def swap_name(name)
  name.split.reverse.join(", ")
end

p swap_name('Joe Roberts') == 'Roberts, Joe'
p swap_name("Steven Shen")

# Sequence Count
def sequence(a, b)
  arr = []
  a.times do |counter|
    arr << (counter + 1) * b
  end
  arr
end


p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []

# Grade book

def get_grade(x, y, z)
  case (x + y + z) / 3

  when 101..Float::INFINITY
    'A+'
  when 90..100
    'A'
  when 80..90
    'B'
  when 70..80
    'C'
  when 60..70
    'D'
  else
    'f'
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"

# Grocery List

def buy_fruit(arr)
  arr.each_with_object([]) do |sub_arr, fruits|
    sub_arr[1].times do
      fruits << sub_arr[0]
    end
  end
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
