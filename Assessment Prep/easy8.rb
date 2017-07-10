# Sum of Sums
def sum_of_sums(arr)
  sum_of_sums = 0
  total_sum = arr.inject do |sum, n|
    sum_of_sums += sum
    sum + n
  end
   sum_of_sums += total_sum
end

p sum_of_sums([3, 5, 2]) == 21
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35

# Madlibs
def madlibs
  puts "Enter a noun:"
  noun = gets.chomp
  puts "Enter a verb:"
  verb = gets.chomp
  puts "Enter an adjective:"
  adj = gets.chomp
  puts "Enter an adverb:"
  adv = gets.chomp

  puts "Do you #{verb} your #{adj} #{noun} #{adv}? That's hilarious!"
end

# Leading Substrings
def substrings_at_start(str)
  substrings = []
  1.upto(str.length) do |counter|
    substrings << str[0, counter]
  end
  substrings
end

p substrings_at_start('abc')
p substrings_at_start('a') == ['a']
p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

# All Substrings
def substrings(str)
  substrings = []
  start = 0
  loop do
    start.upto(str.length-1) do |counter|
      substrings << str[start..counter]
    end
    start += 1
    break if start == str.length
  end
  substrings
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]

# Palindromic Substrings
def palindromes(str)
  substrings = substrings(str)

  palindrome_strings = substrings.select do |substring|
    palindrome = false
    substring.chars.each_with_index do |char, index|
      if char != substring[-1-index] || substring.length == 1
        palindrome = false
        break
      end
      palindrome = true
    end
    palindrome
  end

  palindrome_strings
end



p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

# fizzbuzz
def fizzbuzz(a, b)
  (a..b).each do |num|
    if num % 15 == 0
      puts "FizzBuzz"
    elsif num % 3 == 0
      puts "Fizz"
    elsif num % 5 == 0
      puts "Buzz"
    else
      puts num
    end
  end
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz

# Double Char (Pt1)
def repeater(str)
  doubled_str = ''
  str.chars.each do |char|
    2.times do
      doubled_str << char
    end
  end
  doubled_str
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''

# Double Char (Part 2)
def double_consonants(str)
  doubled_consonants = ''
  str.chars.each do |char|
    if 'bcdfghjklmnpqrstvwxyz'.include?(char.downcase)
      2.times do
        doubled_consonants << char
      end
    else
      doubled_consonants << char
    end
  end
  doubled_consonants
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!")  == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""

# Convert number to reversed array of digits
def reversed_number(n)
  n.to_s.chars.reverse.join.to_i
end

p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # Note that zeros get dropped!
p reversed_number(1) == 1

# Get The Middle Character
def center_of(str)
  if str.length.odd?
    return str[str.length/2]
  else
    return str[str.length/2 - 1] + str[str.length/2]
  end
end


p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'
