DEFAULT_PROMPT = %w(r=rock p=paper s=scissors l=lizard sp=spock)

VALID_CHOICES = %w(r p s l sp)

HAND_COMBOS = {
  r: %w(l s),
  p: %w(r sp),
  s: %w(p l),
  l: %w(p sp),
  sp: %w(r s)
}

def intro
  puts "Scissors cuts paper, paper covers rock,
  rock crushes lizard, lizard poisons Spock,
  Spock smashes scissors, scissors decapitates lizard,
  lizard eats paper, paper disproves Spock, Spock vaporizes rock,
  and as it always has, rock crushes scissors.
  ************************************
  The game is first to 5; Ties do not count."
end

def expand_name(abbr)
  case abbr
  when 'r' then 'Rock'
  when 'p' then 'Paper'
  when 's' then 'Scissors'
  when 'l' then 'Lizard'
  when 'sp' then 'Spock'
  end
end

def display_results(user, computer)
  if user == computer.to_sym
    prompt("Battle = DRAW!")
  elsif win?(user, computer)
    prompt('Won The Battle!')
  else
    prompt('Lost The Battle!')
  end
end

def end_game?
  exit(false)
end


def is_winner(first, second)
  if first == 5
    puts "You won the game! You Reached 5 first!"
    end_game?
  elsif second == 5
    puts "You lost the game! Comp reached 5 first"
    end_game?
  end
end

def win?(user, computer)
  HAND_COMBOS[user.to_sym].include?(computer)
end

def prompt(message)
  puts("=> #{message}")
end

def clear_screen
  system('clear') || system('cls')
end

scoreboard = {
  wins: 0,
  loss: 0,
  tie: 0
}
puts intro
loop do
  choice = ''
  loop do
    prompt("Choose one: #{DEFAULT_PROMPT.join(', ')}")
    choice = gets.chomp.downcase
    if VALID_CHOICES.include?(choice)
      break
    else
      prompt('not a valid choice.')
    end
  end

  computer_choice = VALID_CHOICES.sample

  user_expanded = expand_name(choice)
  comp_expanded = expand_name(computer_choice)
  prompt("You chose: #{user_expanded} | Computer chose: #{comp_expanded}")

  display_results(choice, computer_choice)

  if win?(choice, computer_choice)
    scoreboard[:wins] += 1
  elsif win?(computer_choice, choice)
    scoreboard[:loss] += 1
  else
    scoreboard[:tie] += 1
  end

  prompt("SCOREBOARD:
     Wins= #{scoreboard[:wins]}
     Loss= #{scoreboard[:loss]}
     Ties= #{scoreboard[:tie]}")

  is_winner(scoreboard[:wins].to_i, scoreboard[:loss].to_i)
  prompt('End Game? y/n')

  loop do
    answer = gets.chomp.downcase
    if answer == 'y'
      clear_screen
      break
    elsif answer == 'n'
      puts "Thanks for Playing!"
      end_game?
    else
      puts "please use y/n"
    end
  end
end
