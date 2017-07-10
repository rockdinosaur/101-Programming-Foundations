# Using the Ruby language, have the function AlphabetSoup(str) take the str string parameter being passed and return the string with the letters in alphabetical order (ie. hello becomes ehllo). Assume numbers and punctuation symbols will not be included in the string.

def AlphabetSoup(str)
  str.chars.sort.join
end

p AlphabetSoup('coderbyte')

#-------------------------------------------------------------------------------------------------------------------------------

#A string is considered to be in title case if each word in the string is either (a) capitalised (that is, only the first letter of the word is in upper case) or (b) considered to be an exception and put entirely into lower case unless it is the first word, which is always capitalised.

#Write a function that will convert a string into title case, given an optional list of exceptions (minor words). The list of minor words will be given as a string with each word separated by a space. Your function should ignore the case of the minor words string -- it should behave in the same way even if the case of the minor word string is changed.

###Arguments (Haskell)

# First argument: space-delimited list of minor words that must always be lowercase except for the first word in the string.
# Second argument: the original string to be converted.
###Arguments (Other languages)

# First argument (required): the original string to be converted.
# Second argument (optional): space-delimited list of minor words that must always be lowercase except for the first word in the string. The JavaScript/CoffeeScript tests will pass undefined when this argument is unused.
# ###Example

# title_case('a clash of KINGS', 'a an the of') # should return: 'A Clash of Kings'
# title_case('THE WIND IN THE WILLOWS', 'The In') # should return: 'The Wind in the Willows'
# title_case('the quick brown fox') # should return: 'The Quick Brown Fox'

def title_case(title, minor_words = '')
  minor_words_arr = minor_words.downcase.split
  title_words = title.split
  title_words.each_with_index do |title_word, index|
    if index == 0 || !minor_words_arr.include?(title_word.downcase)
      title_words[index] = title_words[index].capitalize
    else
      title_words[index] = title_words[index].downcase
    end
  end
  title_words.join(' ')
end

p title_case('a clash of KINGS', 'a an the of') # should return: 'A Clash of Kings'
p title_case('THE WIND IN THE WILLOWS', 'The In') # should return: 'The Wind in the Willows'
p title_case('the quick brown fox') # should return: 'The Quick Brown Fox'
#-----------------------------------------------------------------------------------------------------------------------------
# Simple, remove the spaces from the string, then return the resultant string.

def no_space(x)
  x.gsub(" ", "")
end

p no_space('8 j 8   mBliB8g  imjB8B8  jl  B')
p no_space('8 8 Bi fk8h B 8 BB8B B B  B888 c hl8 BhB fd')
p no_space('8aaaaa dddd r     ')
p no_space('jfBm  gk lf8hg  88lbe8 ')
p no_space('8j aam')
#-----------------------------------------------------------------------------------------------------------------------------
# Create a function that returns the sum of the two lowest positive numbers given an array of minimum 4 integers. No floats or empty arrays will be passed.

# For example, when an array is passed like [19,5,42,2,77], the output should be 7.
#
# [10,343445353,3453445,3453545353453] should return 3453455.
#
# Hint: Do not modify the original array.

def sum_of_two_smallest_numbers(arr)
  arr.sort[0] + arr.sort[1]
end
#-----------------------------------------------------------------------------------------------------------------------------
# Take a Number And Sum Its Digits Raised To The Consecutive Powers And ....¡Eureka!!
# The number 89 is the first integer with more than one digit that fulfills the property partially introduced in the title of this kata. What's the use of saying "Eureka"? Because this sum gives the same number.
#
# In effect: 89 = 8^1 + 9^2
#
# The next number in having this property is 135.
#
# See this property again: 135 = 1^1 + 3^2 + 5^3
#
# We need a function to collect these numbers, that may receive two integers a, b that defines the range [a, b] (inclusive) and outputs a list of the sorted numbers in the range that fulfills the property described above.
#
# Let's see some cases:
#
# sum_dig_pow(1, 10) == [1, 2, 3, 4, 5, 6, 7, 8, 9]
#
# sum_dig_pow(1, 100) == [1, 2, 3, 4, 5, 6, 7, 8, 9, 89]
# If there are no numbers of this kind in the range [a, b] the function should output an empty list.
#
# sum_dig_pow(90, 100) == []

def sum_dig_pow(a, b)
  eureka = []
  split_num = ''
  (a..b).to_a.each do |num|
    split_num = num.to_s.split('')
    exponent = 1
    sum_of_digits = 0
    split_num.each do |digit|
      sum_of_digits += digit.to_i ** exponent
      exponent += 1
    end
    if sum_of_digits == num
      eureka << num
    end
  end
  eureka
end

p sum_dig_pow(1, 100) # [1, 2, 3, 4, 5, 6, 7, 8, 9, 89]
#----------------------------------------------------------------------------------------------------------------------------
# Number of people in the bus
#
# There is a bus moving in the city, and it takes and drop some people in each bus stop.
#
# You are provided with a list (or array) of integer arrays (or tuples). Each integer array has two items which represent number of people get into bus (The first item) and number of people get off the bus (The second item) in a bus stop.
#
# Your task is to return number of people who are still in the bus after the last bus station (after the last array). Even though it is the last bus stop, the bus is not empty and some people are still in the bus, and they are probably sleeping there :D
#
# Take a look on the test cases.
#
# Please keep in mind that the test cases ensure that the number of people in the bus is always >= 0. So the return integer can't be negative.
#
# The second value in the first integer array is 0, since the bus is empty in the first bus stop.
def number(bus_stop)
  people_left = 0
  bus_stop.each do |stop|
    people_left += (stop[0] - stop[1])
  end
  people_left
end

#----------------------------------------------------------------------------------------------------------------------------
# Given the triangle of consecutive odd numbers:
#
#              1
#           3     5
#        7     9    11
#    13    15    17    19
# 21    23    25    27    29
# ...
# Calculate the row sums of this triangle from the row index (starting at index 1) e.g.:
#
# row_sum_odd_numbers(1); # 1
# row_sum_odd_numbers(2); # 3 + 5 = 8

# [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21]
# n = 1, index = 0
# n = 2, index = 1
# n = 3, index = 3
# n = 4, index = 6
# n = 5, index = 10
#
# index = n (n - 1) / 2
# number of odds in that row = n starting at index
# number @ index = 2 * index + 1

def row_sum_odd_numbers(n)
  starting_odd = (n * (n - 1) / 2) * 2 + 1
  sum_of_odd = 0
  (n).times do
    sum_of_odd += starting_odd
    starting_odd += 2
  end
  sum_of_odd
end

# row_sum_odd_numbers(1); # 1
p row_sum_odd_numbers(3); # 3 + 5 = 8
#----------------------------------------------------------------------------------------------------------------------------
# Build a pile of Cubes
# Your task is to construct a building which will be a pile of n cubes. The cube at the bottom will have a volume of n^3, the cube above will have volume of (n-1)^3 and so on until the top which will have a volume of 1^3.
#
# You are given the total volume m of the building. Being given m can you find the number n of cubes you will have to build?
#
# The parameter of the function findNb (find_nb, find-nb, findNb) will be an integer m and you have to return the integer n such as n^3 + (n-1)^3 + ... + 1^3 = m if such a n exists or -1 if there is no such n.
#
# Examples:
#
# findNb(1071225) --> 45
# findNb(91716553919377) --> -1

def findNb(m)
  # n^3 + (n-1)^3 + (n-2)^3 + ... 1^3 = m
  # m - 1 - 8 - 27 - 64 - ... etc = 0
  base = 1
  loop do
    m -= (base ** 3)
    break if m <= 0
    base += 1
  end
  m < 0 ? -1 : base
end

p findNb(1071225)# --> 45
p findNb(91716553919377) #--> -1
