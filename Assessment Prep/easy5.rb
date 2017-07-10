# ASCII String Value
def ascii_value(str)
  str.chars.inject(0) {|ascii_sum, char| ascii_sum + char.ord}
end

p ascii_value('Four score')
p ascii_value('Launch School')
p ascii_value('a')
p ascii_value('')

# After Midnight (Part 1)
def time_of_day(input_minutes)
  start_time_minutes = 0
  start_time_hours = 0
  hours = 0
  minutes = 0

  if input_minutes < 0
    hours, minutes = (-input_minutes).divmod(60)
  elsif input_minutes > 0
    hours, minutes = input_minutes.divmod(60)
  else
    hours = 0
    minutes = 0
  end

  if input_minutes > 0
    start_time_minutes += minutes
    start_time_hours += hours
    if start_time_hours >= 24
      start_time_hours %= 24
    end
  elsif input_minutes < 0
    start_time_minutes = 60 - minutes
    start_time_hours = 23 - hours
    if start_time_hours < 0
      start_time_hours %= 24
    end
  end

  digital_minutes = ''
  digital_hours = ''

  if start_time_minutes < 10
    digital_minutes = "0#{start_time_minutes}"
  else
    digital_minutes = "#{start_time_minutes}"
  end

  if start_time_hours < 10
    digital_hours = "0#{start_time_hours}"
  else
    digital_hours = "#{start_time_hours}"
  end

  digital_clock = digital_hours + ":" + digital_minutes
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def time_of_day1(delta_minutes)
  delta_minutes =  delta_minutes % MINUTES_PER_DAY
  hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
  format('%02d:%02d', hours, minutes)
end

p time_of_day1(-72)

# After Midnight (Part 2)
MINUTES_IN_HOUR = 60
HOURS_IN_DAY = 24

def after_midnight(time_string)
  hour, minute = time_string.split(":")
  (hour.to_i * MINUTES_IN_HOUR + minute.to_i) % (HOURS_IN_DAY * MINUTES_IN_HOUR)
end

def before_midnight(time_string)
  hour, minute = time_string.split(":")
  (HOURS_IN_DAY * MINUTES_IN_HOUR - (hour.to_i * MINUTES_IN_HOUR + minute.to_i)) % (HOURS_IN_DAY * MINUTES_IN_HOUR)
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0

# Letter Swap
def swap(string)
  #iterate through string and reverse every word
  reversed_array = string.split.map do |word|
    last_letter = word.split("").last
    first_letter = word.split("").first
    word[0] = last_letter
    word[-1] = first_letter
    word
  end
  reversed_array.join(" ")
end

p swap('Oh what a wonderful day it is')
p swap('Abcde')
p swap('a') == 'a'

# Clean up the words
ALPHABET = 'abcdefghijklmnopqrstuvwxyz'

def cleanup(string)
  cleaned_array = string.chars.map do |char|
    if ALPHABET.include?(char)
      char
    else
      ' '
    end
  end

  indices_of_extra_spaces = []
  counter = 1
  cleaned_array.each do |char|
    if char == ' ' && cleaned_array[counter] == ' '
      indices_of_extra_spaces << counter
    end
    counter += 1
  end

  cleaned_array_final = []
  counter = 0
  loop do
    cleaned_array_final << cleaned_array[counter] if !indices_of_extra_spaces.include?(counter)
    counter += 1
    break if counter == cleaned_array.length
  end
  cleaned_array_final.join("")
end

def cleanup2(string)
  string.gsub(/[^a-zA-Z]+/,' ')
end

p cleanup("---what's my +*& line?") == ' what s my line '
p cleanup2("---what's my +*& line?") == ' what s my line '

# Letter Counter (Part 1)
def word_sizes(string)
  word_array = string.split
  word_array.each_with_object({}) do |word, hash|
    if hash.has_key?(word.count('a-zA-Z'))
      hash[word.count('a-zA-Z')] += 1
    else
      hash[word.count('a-zA-Z')] = 1
    end
  end
end

def word_sizes2(string)
  hash = Hash.new(0) # initializes an empty hash but with values defaulted at 0
  word_array = string.split
  word_array.each do |word|
    hash[word.count('a-zA-Z')] += 1
  end
  hash
end
#
# p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
# p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
# p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
# p word_sizes('') == {}

# Letter Counter (Part 2)
p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}

p word_sizes2('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes2('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes2("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes2('') == {}
# split string into word array
# iterate through the words and create a new array where everything but alphabetical characters are removed
# create a hash with the keys being the length of the words in the new array and its value being the number of words with that length

# Alphabetical Numbers
NUMBERS_ENGLISH = {
0 => 'zero',
1 => 'one',
2 => 'two',
3 => 'three',
4 => 'four',
5 => 'five',
6 => 'six',
7 => 'seven',
8 => 'eight',
9 => 'nine',
10 => 'ten',
11 => 'eleven',
12 => 'twelve',
13 => 'thirteen',
14 => 'fourteen',
15 => 'fifteen',
16 => 'sixteen',
17 => 'seventeen',
18 => 'eighteen',
19 => 'nineteen'
}

def alphabetic_number_sort(arr)
  arr.sort_by {|num| NUMBERS_ENGLISH[num]}
  # english_arr = arr.map do |num|
  #   NUMBERS_ENGLISH[num]
  # end
  #
  # english_arr.sort! do |a, b|
  #   a <=> b
  # end
  #
  # english_arr.map do |word|
  #   NUMBERS_ENGLISH.key(word)
  # end
end

p alphabetic_number_sort((0..19).to_a)

# ddaaiillyy ddoouubbllee

def crunch(string)
  string_array = string.chars
  counter = 0

  loop do
    loop do
      if string_array[counter] == string_array[counter + 1]
        string_array.delete_at(counter + 1)
        break
      else
        counter += 1
        break if counter == string_array.length
      end
    end
    break if counter == string_array.length
  end

  string_array.join
end

p crunch('ddaaiillyy ddoouubbllee')
p crunch('4444abcabccba')
p crunch('ggggggggggggggg')
p crunch('a') == 'a'
p crunch('') == ''

# iterate through letters of the string
# if the next letter is == current letter, delete that letter
# restart the iteration

# Bannerizer

def print_in_box(string)
  width = string.length + 4
  horizontal_line = "+" + "-" * width + "+"
  empty_line = "|" + " " * width + "|"
  string_line = "|" + " " * 2 + string + " " * 2 + "|"

  puts horizontal_line
  puts empty_line
  puts string_line
  puts empty_line
  puts horizontal_line
end

print_in_box('To boldly go where no one has gone before.')
