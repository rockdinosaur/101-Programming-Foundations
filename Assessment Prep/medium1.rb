# Rotation (Part 1)
def rotate_array(arr)
  rotated_arr = arr.clone
  rotated_arr << rotated_arr.shift
end


# p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
# p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# p rotate_array(['a']) == ['a']
#
# x = [1, 2, 3, 4]
# p rotate_array(x) == [2, 3, 4, 1]   # => true
# p x == [1, 2, 3, 4]                 # => true

# Rotation (Part 2)

def rotate_rightmost_digits(num, digit)
  num_string = num.to_s
  num_string << num_string.slice!(-digit)
  num_string.to_i
end

# p rotate_rightmost_digits(735291, 1)
# p rotate_rightmost_digits(735291, 2)
# p rotate_rightmost_digits(735291, 3) == 735912
# p rotate_rightmost_digits(735291, 4) == 732915
# p rotate_rightmost_digits(735291, 5) == 752913
# p rotate_rightmost_digits(735291, 6) == 352917

# Rotation (Part 3)
def max_rotation(n)
  counter = 0
  num_string = n.to_s
  loop do
    num_string << num_string.slice!(counter)
    counter += 1
    break if counter >= n.to_s.length - 1
  end
  num_string.to_i
end

# p max_rotation(735291) == 321579
# p max_rotation(3) == 3
# p max_rotation(35) == 53
# p max_rotation(105)
# p max_rotation(8_703_529_146) == 7_321_609_845

# 1000 Lights

lights_hash = (1..1000).each_with_object({}) do |n, hash|
  hash[n] = 'on'
end

multiple = 2
loop do
  lights_hash.each do |light_num, status|
    if light_num % multiple == 0
      if status == 'off'
        lights_hash[light_num] = 'on'
      else
        lights_hash[light_num] = 'off'
      end
    end
  end
  multiple += 1
  break if multiple > lights_hash.length
end

turned_on = lights_hash.each_with_object([]) do |(light_num, status), turned_on|
  if status == 'on'
    turned_on << {light_num => status}
  end
end

# puts turned_on

# Diamonds!

def diamond(n)
  counter = 1
  loop do
    puts " " * ((n - counter) / 2) + "*" * counter + " " * ((n - counter) / 2)
    counter += 2
    break if counter > n
  end
  counter = n - 2
  loop do
    puts " " * ((n - counter) / 2) + "*" * counter + " " * ((n - counter) / 2)
    counter -= 2
    break if counter < 1
  end
end

# diamond(9)

def empty_diamond(n)
  counter = 3
  spaces = 1
  puts "*".center(n)
  loop do
    puts " " * ((n - counter) / 2) + "*" + " " * spaces + "*" + " " * ((n - counter) / 2)
    spaces = counter
    counter += 2
    break if counter > n
  end
  counter = n - 2
  spaces = counter - 2
  loop do
    puts " " * ((n - counter) / 2) + "*" + " " * spaces + "*" + " " * ((n - counter) / 2)
    counter -= 2
    spaces = counter - 2
    break if counter < 3
  end
  puts "*".center(n)
end

# empty_diamond(9)

# Stack Machine Interpretation


# stack is an array of values that can be pushed and popped
# register is a single value stored separately from the stack
# the last value of the stack if popped anytime an operation is performed
# operation is performed like this: register (operation) stack.pop
# method takes an input string which contains correct instructions (won't pop a non-existent  value, etc)
# register is initialized to 0
# n places a value in the register

# iterate through the words of the input
# if current word is: n Place a value n in the "register". Do not modify the stack.
# PUSH Push the register value on to the stack. Leave the value in the register.
# ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
# SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
# MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
# DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
# MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
# POP Remove the topmost item from the stack and place in register
# PRINT Print the register value

def minilang(input)
  stack = []
  register = 0

  input.split.each do |command|
    if command.to_i.to_s == command
      register = command.to_i
    else
      case command
      when "PUSH"
        stack.push(register)
      when "ADD"
        register += stack.pop
      when "SUB"
        register -= stack.pop
      when "MULT"
        register *= stack.pop
      when "DIV"
        register /= stack.pop
      when "MOD"
        register %= stack.pop
      when "POP"
        register = stack.pop
      when "PRINT"
        puts register
      end
    end
  end
end

# minilang('PRINT')
# minilang('5 PUSH 3 MULT PRINT')
# minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# minilang('5 PUSH POP PRINT')
# minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# minilang('-3 PUSH 5 SUB PRINT')
# minilang('6 PUSH')

# Word to Digit
NUMBERS = {
  'zero' => '0',
  'one'  => '1',
  'two'  => '2',
  'three' => '3',
  'four' => '4',
  'five' => '5',
  'six' => '6',
  'seven' => '7',
  'eight' => '8',
  'nine' => '9'
}

def word_to_digit(input)
  message = []
  value = ''
  key = ''
  num_strings = NUMBERS.keys

  input.split.each do |word|

    num_strings.each do |numstring|
      if word.include?(numstring)
        value = NUMBERS[numstring]
        key = numstring
        break
      end
    end

    message << word.gsub(key, value)
  end

  message.join(" ")
end

# iterate through input string
# if one of the keys includes word, gsub the word for the key's value

p word_to_digit('Please call me at five five five one two three four. Thanks.')
p word_to_digit("Hi I'm Jing. six four seven three zero zero")
p word_to_digit("one eight three")

# Fibonacci Numbers (Recursion)

def fibonacci(n)
  if n <= 2
    1
  else
    fibonacci(n - 1) + fibonacci(n - 2)
  end
end

p fibonacci(12)

# fib:   1 1 2 3 5 8
# order: 1 2 3 4 5 6

# Fibonacci Numbers (Procedural)

def fibonacci_procedural(n)
  prev_num1 = 1
  prev_num2 = 1
  fib_num = 0
  if n <= 2
    return 1
  else
    (n - 2).times do
      fib_num = prev_num1 + prev_num2
      prev_num2 = prev_num1
      prev_num1 = fib_num
    end
  end
  fib_num
end

p fibonacci_procedural(20)

# Fibonacci Numbers (Last Digit)

def fibonacci_last(n)
  prev_num1 = 1
  prev_num2 = 1
  fib_num_last = 0
  ((n - 2) % 60).times do # => the last digit of the fibonacci sequence repeats every 60 iterations
    fib_num_last = (prev_num1 + prev_num2) % 10
    prev_num2 = prev_num1
    prev_num1 = fib_num_last
  end
  fib_num_last
end

p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) # -> 4
p fibonacci_last(123_456_789_987_745) # -> last digit of fibonacci sequence repeats every 60 iterations
