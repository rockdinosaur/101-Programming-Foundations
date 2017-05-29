#1

#START

#GET 2 integers from user
#add the 2 integers and return the result

#END

def add
  puts "What is the first number?"
  num1 = gets.chomp.to_i
  puts "What is the second number?"
  num2 = gets.chomp.to_i

  sum = num1 + num2
  puts "The sum of the two numbers is #{sum}"
end

add()
#2

#START

#Create a method that takes an array of strings
 #iterate through the array and concatenate each strings

#end

def addstrings(array)
  string = ""
  array.each do |word|
    string = string + word
  end
  puts string
end

arr = ["school", "bus", "red"]
addstrings(arr)


#3
def numarray(array)
  array.reject! {|v| array.index(v).odd?}
  puts array
end

numarray = [0, 1, 2, 3, 4]
numarray(numarray)
