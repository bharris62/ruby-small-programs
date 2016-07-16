DEFAULT_PROMPT = %w(r=rock p=paper s=scissors l=lizard sp=spock)

VALID_CHOICES = %w(r p s l sp)

HAND_COMBOS = {
  r: %w(l s),
  p: %w(r sp),
  s: %w(p l),
  l: %w(p sp),
  sp: %w(r s)
}

def expand_name(abbr)
  case abbr
  when 'r' then p 'rock'
  when 'p' then 'paper'
  when 's' then 'scissors'
  when 'l' then 'lizard'
  when 'sp' then 'spock'
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

def win?(user, computer)
  HAND_COMBOS[user.to_sym].include?(computer)
end

def prompt(message)
  puts("=> #{message}")
end

scoreboard = {
  wins: 0,
  loss: 0,
  tie: 0
}

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

  prompt('Play Again? y/n')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt('thanks for playing!')
