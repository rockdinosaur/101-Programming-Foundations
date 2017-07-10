# Searching 101
def prompt(msg)
  puts "==> #{msg}"
end

# num_array = []
#
# while num_array.size < 6
#   counter = 1
#   prompt "Enter number #{counter}:"
#   num = gets.chomp.to_i
#   num_array << num
#   counter += 1
# end
#
# if num_array.length != num_array.uniq.length
#   puts "The number #{num_array.last} appears in #{num_array}"
# else
#   puts "The number #{num_array.last} does NOT appear in #{num_array}"
# end
#
# #

# Arithmetic Integer
# prompt "Enter the first number:"
# num1 = gets.chomp.to_i
#
# prompt "Enter the second number:"
# num2 = gets.chomp.to_i
#
# sum = num1 + num2
# diff = num1 - num2
# product = num1 * num2
# quotient = num1 / num2
#
# prompt "#{num1} + #{num2} = #{sum}"
# prompt "#{num1} - #{num2} = #{diff}"
# prompt "#{num1} * #{num2} = #{product}"
# prompt "#{num1} / #{num2} = #{quotient}"

# Counter the Number of Characters
# prompt "Please write a word or multiple words:"
# string = gets.chomp
#
# prompt "There are #{string.length - string.count(' ')} characters in #{string}"

# Multiplying Two Numbers
# def multiply(a, b)
#   a * b
# end
#
# p multiply(3, 5)
#
# # Squaring an Argument
# def square(num, power)
#   exponent = 1
#   power.times do
#     exponent *= multiply(num, num)
#   end
#   exponent
# end
#
# p square(2, 3)
# p square(3, 4)

# Exclusive Or
# def xor?(condition1, condition2)
#   return true if condition1 && !condition2
#   return true if condition2 && !condition1
#   false
# end
#
# p xor?(5.even?, 4.even?) == true
# p xor?(5.odd?, 4.odd?) == true
# p xor?(5.odd?, 4.even?) == false
# p xor?(5.even?, 4.odd?) == false

# Odd Lists
# def oddities(array)
#   array.select do |element|
#     array.index(element).even?
#   end
# end
#
# p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
# p oddities(['abc', 'def']) == ['abc']
# p oddities([123]) == [123]
# p oddities([]) == []

# Palindromic Strings (pt1)
# def palindrome?(string_or_array)
#   return true if string_or_array == string_or_array.reverse
#   false
# end
#
# p palindrome?('madam') == true
# p palindrome?('Madam') == false          # (case matters)
# p palindrome?("madam i'm adam") == false # (all characters matter)
# p palindrome?('356653') == true
# p palindrome?([1, 2, 3, 4, 5, 6]) == false
# p palindrome?([2, 3, 1, 3, 2]) == true

# Palindromic Strings (pt2)
# def real_palindrome?(string)
#   return true if string.downcase.delete(" ,'") == string.downcase.delete(" ,'").reverse
#   false
# end
#
# p real_palindrome?('madam') == true
# p real_palindrome?('Madam') == true           # (case does not matter)
# p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
# p real_palindrome?('356653') == true
# p real_palindrome?('356a653') == true
# p real_palindrome?('123ab321') == false

# Palindromic Numbers
def palindromic_number?(num)
  return true if num.to_s.reverse == num.to_s
  false
end

p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true
