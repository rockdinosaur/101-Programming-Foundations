VALID_CHOICES = %w(rock paper scissors spock lizard)

def prompt(message)
  puts "=> #{message}"
end

# Convert short hand choice into proper choice name
def choice(choice_short)
  if choice_short.start_with?('r')
    'rock'
  elsif choice_short.start_with?('p')
    'paper'
  elsif choice_short.start_with?('sc')
    'scissors'
  elsif choice_short.start_with?('sp')
    'spock'
  elsif choice_short.start_with?('l')
    'lizard'
  else
    false
  end
end

def win?(first, second)
  (first == 'rock' && (second == 'scissors' || second == 'lizard')) ||
    (first == 'paper' && (second == 'rock' || second == 'spock')) ||
    (first == 'scissors' && (second == 'paper' || second == 'lizard')) ||
    (first == 'spock'  && (second == 'scissors' || second == 'rock')) ||
    (first == 'lizard' && (second == 'spock' || second == 'paper'))
end

def display_results(player, computer, player_score, computer_score)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
  prompt("Your score: #{player_score} | Computer score: #{computer_score}")
end

def score?(player, computer)
  if win?(player, computer)
    true
  elsif win?(computer, player)
    false
  end
end

# Main Program
player_score = 0
computer_score = 0

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(' ,')}")
    menu = <<-MENU
    Enter 'r' -> Rock
          'p'  -> Paper
          'sc' -> Scissors
          'sp' -> Spock
          'l'  -> Lizard
          MENU
    prompt(menu)

    choice_short = gets.chomp.downcase

    if choice(choice_short) == false
      prompt("That's not a valid choice!")
    else
      choice = choice(choice_short)
      break
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{choice}. Computer chose: #{computer_choice}")

  player_score += 1 if score?(choice, computer_choice) == true
  computer_score += 1 if score?(choice, computer_choice) == false

  display_results(choice, computer_choice, player_score, computer_score)

  if player_score == 5 || computer_score == 5
    player_score = 0
    computer_score = 0

    prompt("Do you want to play again?")
    answer = gets.chomp
    break unless answer.downcase.start_with?('y')
  end
end

prompt("Thank you for playing!")
