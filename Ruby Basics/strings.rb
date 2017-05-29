# 1
empty_string = String.new
puts empty_string

# 2
puts "this is an escaped double quote: \" and this is an escaped single quote \'"

# 3 Ignoring case
name = 'Roger'

puts name.casecmp("RoGeR") == 0
puts name.casecmp("DAVE") == 0

# 4 Dynamic String
name = 'Elizabeth'
puts "Hello, #{name}"

# 5 Combining Names
first_name = 'John'
last_name = 'Doe'

full_name = first_name + ' ' + last_name
puts full_name

# 6 Tricky Formatting
state = 'tExAs'

state.capitalize!
puts state

# 7 Goodbye, not Hello
greeting = 'Hello!'

greeting.replace('Goodbye') # or greeting.gsub!('Hello', 'Goodbye')

puts greeting

 # 8 Print the Alphabet

alphabet = 'abcdefghijklmnopqrstuvwxyz'
alphabet.split('').each do |x|
  puts x
end

# 9 Pluralize
words = 'car human elephant airplane'

words.split.each do |x|
  puts x + 's'
end

# 10 Are You There?
colors = 'blue pink yellow orange'

puts colors.include?('yellow')
puts colors.include?('purple')
