require 'pry'

def prompt(message)
  puts "=> #{message}"
end

prompt("Welcome to the Mortage Calculator!")
prompt("----------------------------------")

loop do

  loan = ''
  apr = ''
  duration_in_years = ''

  prompt("Enter your loan amount:")

  loop do
    loan = gets.chomp()

    if loan.empty? || loan.to_f() < 0
      prompt("Please enter a valid number")
    else
      break
    end
  end

  prompt("Enter your loan's Annual Percentage Rate (ex: 5.5 for 5.5%)")

  loop do
    apr = gets.chomp()

    if apr.to_f() < 0 || apr.empty?()
      prompt("Please enter a valid APR")
    else
      break
    end
  end

  prompt("Enter your loan duration in years")

  loop do
    duration_in_years = gets.chomp()

    if duration_in_years.to_f() < 0 || duration_in_years.empty?()
      prompt("Please enter a valid duration")
    else
      break
    end
  end

  apr = apr.to_f() / 100
  monthly_interest = apr / 12
  duration_in_months = duration_in_years.to_f() * 12
  monthly_payment = loan.to_f() * (monthly_interest / (1 - (1 + monthly_interest)**(-duration_in_months)))

  prompt("Your monthly payment is: $#{format('%.2f', monthly_payment)}")

  prompt("Would you like to calculate another mortgage?")
  recalculate = gets.chomp()

  break unless recalculate.downcase.start_with?("y")
end

prompt("Thanks for consulting the mortgage calculator!")
