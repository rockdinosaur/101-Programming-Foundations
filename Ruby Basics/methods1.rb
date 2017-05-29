# 1 Greeting Through Methods
def greet_pt1
  "Hello"
end

def greet_pt2
  "World"
end

puts "#{greet_pt1} #{greet_pt2}"

# 2 Greeting Through Methods (pt2)
def greet
  greet_pt1 + " " + greet_pt2
end

puts greet

#3 Make and Model
def car(make, model)
  puts "#{make} #{model}"
end

car("Toyota", "Camry")

#4 Day or Night?
daylight = [true, false].sample

def time_of_day(x)
  if x
    puts "It's daytime!"
  else
    puts "It's nighttime!"
  end
end

time_of_day(daylight)

# 5 Naming Animals
def dog(name)
  return name
end

def cat(name)
  return name
end

puts "The dog's name is #{dog('Spot')}."
puts "The cat's name is #{cat('Ginger')}."

# 6 Name Not Found
def assign_name(name="Bob")
  return name
end

puts assign_name == 'Bob'
puts assign_name('Kevin') == 'Kevin'

# 7 Multiply the Sum
def multiply(a, b)
  a * b
end

def add(a, b)
  a + b
end

puts add(2, 2) == 4
puts add(5, 4) == 9
puts multiply(add(2, 2), add(5, 4)) == 36

# 8 Random Sentence
names = ['Dave', 'Sally', 'George', 'Jessica']
activities = ['walking', 'running', 'cycling']

def name(array)
  array.sample
end

def activity(array)
  array.sample
end

def sentence(name, activity)
  name + " loves " + activity
end

puts sentence(name(names), activity(activities))

# 9 Print me (Pt1)
def print_me
  puts "I'm printing within the method!"
end

print_me

#10 Print me(pt2)
def print_me2
  "I'm printing the return value"
end

puts print_me2
