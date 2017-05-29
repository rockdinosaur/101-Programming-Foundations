# 1
10.times { |index| puts "\n" + (' ' * index) + 'The Flintstones Rock!' }

# 2
puts "the value of 40 + 2 is #{40 + 2}"

# 3
def factors(number)
  dividend = number
  divisors = []
  if dividend <= 0
    puts "Enter a valid number"
  else
    loop do
      if (number % dividend).zero?
        divisors << dividend
      end

      dividend -= 1

      if dividend.zero?
        break
      end
    end
    p "Your number was: #{number}"
    p "Here are its factors: #{divisors}"
  end
end

p factors(20)

# 4
def test1(arr)
  array1 = arr + [1]
end

array = [1, 2, 3]
p test1(array)
p array

# 5

def fib(first_num, second_num)
  limit = 15
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"

# 6
def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"

  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# 7
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

mess_with_demographics(munsters)

p munsters

test_array = [1, 2, 3, 4, 5]

def incr_array(array)
  array.each do |num|
    num += 1
  end
end

p incr_array(test_array)
p test_array
