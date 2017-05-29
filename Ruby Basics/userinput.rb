# # Print Something
# choice = nil
# loop do
#   puts '>> Do you want to print something? (y/n)'
#   choice = gets.chomp.downcase
#   if ['y', 'n'].include?choice
#     break
#   else
#     puts "Enter a valid choice"
#   end
# end
# puts "something" unless choice == "n"

# Launch School Printer

# loop do
#   puts "How many output lines do you want? Enter a number >= 3 (Q to quit)"
#   num_lines = gets.chomp
#   if num_lines.downcase == 'q'
#     break
#   elsif num_lines.to_i >= 3
#     num_lines.to_i.times do
#       puts "Launch School is the best!"
#     end
#   else
#     puts "That's not enough lines."
#   end
# end

# # User Name and Password
#
# PASSWORD = "lolwut"
# USERNAME = "admin"
#
# loop do
#   puts '>> Please enter user name:'
#   username = gets.chomp
#
#   puts ">> Please enter your password:"
#   user_password = gets.chomp
#
#   break if user_password == PASSWORD && username == USERNAME
#   puts ">> AUTHORIZATION FAILED!"
# end
#
# puts "Welcome!"

# #Dividing numbers
#
# def valid_number?(number_string)
#   number_string.to_i.to_s == number_string
# end
#
# numerator = nil
# denomenator = nil
#
# loop do
#   puts '>> Please enter the numerator:'
#   numerator = gets.chomp
#   if valid_number?(numerator)
#     numerator = numerator.to_i
#     break
#   else
#     puts "Invalid input. Only integers are allowed"
#   end
# end
#
# loop do
#   puts '>> Please enter the denomenator:'
#   denomenator = gets.chomp
#   if valid_number?(denomenator) && denomenator.to_i != 0
#     denomenator = denomenator.to_i
#     break
#   elsif denomenator.to_i == 0
#     puts "A denominator of 0 is not allowed"
#   else
#     puts "Invalid input. Only integers are allowed"
#   end
# end
#
# quotient = numerator / denomenator
#
# puts "#{numerator}/#{denomenator} is #{quotient}"

# Opposites attract

def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

def get_number
  loop do
    puts ">> Please enter a positive or negative integer:"
    number = gets.chomp
    return number.to_i if valid_number?(number)
    puts ">> Invalid input. Only non-zero integers are allowed"
  end
end


first_number = nil
second_number = nil

loop do
  first_number = get_number
  second_number = get_number
  break if (first_number > 0 && second_number < 0) || (first_number < 0 && second_number > 0)
  puts ">> Sorry, one integeter must be positive and the other must be negative"
  puts ">> Please start over."
end

sum = first_number + second_number
puts "#{first_number} + #{second_number} = #{sum}"
