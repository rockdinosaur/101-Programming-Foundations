# How old is Teddy?
puts "Teddy is #{rand(20..200)} years old!"

# How big is the room?
# puts "Enter the length of the room:"
# length = gets.chomp.to_f
#
# puts "Enter the width of the room:"
# width = gets.chomp.to_f
#
# puts "The area of the room is #{(length * width).round(2)} square meters or #{(length * width * 10.7639).round(2)} square feet."

# Tip Calculator
# puts "What is the bill?"
# bill = gets.chomp.to_f
#
# puts "What is the tip percentage?"
# tip_percent = gets.chomp.to_f / 100
#
# puts "The tip is $#{(bill * tip_percent).round(2)} with the total being $#{bill * (1 + tip_percent)}"

# #When will you retire?
# puts "How old are you?"
# age = gets.chomp.to_i
#
# puts "What age would you like to retire?"
# retire_age = gets.chomp.to_i
# years_left = retire_age - age
# current_year = Time.now.year
#
# puts "It is #{current_year}. You will retire in #{current_year + years_left}. You only have #{years_left} years left!"

# # Greeting a User
# puts "What is your name?"
# name = gets.chomp
#
# if name.end_with?("!")
#   name = name.chop
#   puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
# else
#   puts "Hello #{name}."
# end

# # Odd Numbers
# (1..99).each {|num| puts num if num.odd?}

# # Even Numbers
# counter = 1
# loop do
#   puts counter if counter.even?
#   counter += 1
#   break if counter == 99
# end

# Sum or Product of Consecutive Integers
puts "Enter an integer greater than 0"
int = gets.chomp.to_i

puts "Enter 's' to compute sum  or 'p' to compute product."
choice = gets.chomp

if choice.start_with?('s')
  sum = (1..int).inject(:+)
  puts "The sum of the integers between 1 and #{int} is #{sum}"
elsif choice.start_with?('p')
  product = (1..int).inject(:*)
  puts "The product of the integers between 1 and #{int} is #{product}"
else
  puts "Enter a proper choice"
end
