def prompt(message)
  puts "=> #{message}"
end

def valid_number?(number)
  number.to_i.to_s == number
end

def operation_to_message(operator)
  case operator
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

result = ''
a = ''
b = ''
operation = ''

prompt("Welcome to the Calculator!")

loop do
  prompt("Enter 2 numbers: ")
  loop do
    prompt("First number: ")
    a = gets.chomp

    if valid_number?(a)
      a = a.to_i
      break
    else
      prompt("Enter a valid number")
    end
  end

  loop do
    prompt("Second number: ")
    b = gets.chomp

    if valid_number?(b)
      b = b.to_i
      break
    else
      prompt("Enter a valid number")
    end
  end

  loop do
    operator_prompt = <<-MSG
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
    MSG

    prompt(operator_prompt)

    loop do
      operation = gets.chomp

      if %w(1 2 3 4).include?(operation)
        break
      else
        prompt("Enter a valid operator!")
      end
    end

    prompt("#{operation_to_message(operation)} your two numbers...")

    result = case operation
             when '1'
               a + b
             when '2'
               a - b
             when '3'
               a * b
             when '4'
               a.to_f / b.to_f
             else
               'invalid'
             end

    if result == 'invalid'
      prompt("Invalid operation! Try again")
    else
      break
    end
  end

  prompt("The solution is: #{result}")

  prompt("Would you like to use the calculator again? (y/n)")
  run_again = gets.chomp
  break unless run_again.downcase.start_with?('y')
end

prompt("Bye!")
