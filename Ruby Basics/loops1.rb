numbers = []

while numbers.length < 5
  numbers << rand(100)
end

puts numbers

# Count Up
counter = 1

until counter == 10
  counter += 1
  puts counter
end

counter2 = 1

while counter2 < 10
  counter2 += 1
  puts counter2
end

# Print until
numbers = [7, 9, 13, 25, 18]
index = 0

until index == numbers.length
  puts numbers[index]
  index += 1
end

# That's odd
for i in 1..100
  puts i if i.odd?
end

# Greet Your Friends
friends = ['Sarah', 'John', 'Hannah', 'Dave']

for x in friends
  puts "hello " + x
end

friends.each {|x| puts x}

friends.each do |x|
  puts "yo " + x
end
