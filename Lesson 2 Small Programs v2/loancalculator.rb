def prompt(message)
  puts "=> #{message}"
end

# def check_num?(input)
#   if (input.to_i.to_s == input) && (input.to_i != 0)
#     true
#   else
#     false
#   end
# end

def check_input
  input = gets.chomp
  loop do
    if (input.to_i.to_s == input) && (input.to_i != 0)
      break
    else
      prompt("Enter a valid number!")
      input = gets.chomp
    end
  end
  input
end

prompt("Welcome to the Loan Calculator!")
prompt("-------------------------------")

loop do
  prompt("Enter your loan amount: ")

  loan_amount = check_input.to_i

  prompt("Enter your Annual Percentage Rate (APR): ")

  rate = check_input.to_f / 100 / 12

  prompt("Enter your loan duration in years: ")

  months = check_input.to_i * 12

  monthly_payment = loan_amount * (rate / (1 - (1 + rate)**-months))

  prompt("Your monthly payment should be: $#{monthly_payment.round(2)}")

  prompt("Would you like to perform another calculation?")

  recalculate = gets.chomp
  break unless recalculate.downcase.start_with?('y')
end

prompt("Thanks! See you again")
