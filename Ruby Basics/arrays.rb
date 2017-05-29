# 1 New Pet
pets = ['cat', 'dog', 'fish', 'lizard']

my_pet = pets[2]
puts "I have a pet #{my_pet}"

# 2 More Than one
pets = ['cat', 'dog', 'fish', 'lizard']

my_pets = pets[2..3]
puts "I have a pet #{my_pets[0]} and a pet #{my_pets[1]}"

# 3 Free the lizard
my_pets.pop
puts "I have a pet #{my_pets[0]}"

# 4 One Isnt enough
my_pets << pets[1]
puts "I have a pet #{my_pets[0]} and a pet #{my_pets[1]}"

# 5 What Color are you?
colors = ['red', 'yellow', 'purple', 'green']

colors.each do |color|
  puts "Im the color #{color}"
end

# 6 Doubled
numbers = [1, 2, 3, 4, 5]

doubled_numbers = numbers.map {|x| x * 2}
p doubled_numbers

# 7 Divisible by Three
numbers = [5, 9, 21, 26, 39]
divisible_by_three = numbers.select {|num| num % 3 == 0}
p divisible_by_three

# 8 Favorite Number (pt1)
[['Dave', 7], ['Miranda', 3], ['Jason', 11]]

# 9 Favorite Number (pt2)
favorites = [['Dave', 7], ['Miranda', 3], ['Jason', 11]]
flat_favorites = favorites.flatten
p flat_favorites

# 10 Are we the same?
array1 = [1, 5, 9]
array2 = [1, 9, 5]

puts array1 == array2
