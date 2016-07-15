
USER_CHOICE = %w(rock=r paper=p scissors=s lizard=l spock=sp)

VALID_CHOICES = %w(r p s l sp)

HAND_WINNER = {
  r: %w(l s),
  p: %w(r sp),
  s: %w(p l),
  l: %w(p sp),
  sp: %w(r s)
}

def display_results?(user, computer)
  if user == computer.to_sym
    prompt("Battle = DRAW!")
  elsif win?(user, computer)
    prompt('Won The Battle!')
  else
    prompt('Lost The Battle!')
  end
end

def win?(user, computer)
  HAND_WINNER[user.to_sym].include?(computer)
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
    prompt("Choose one: #{USER_CHOICE.join(', ')}")
    choice = gets.chomp

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt('not a valid choice.')
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{choice} | Computer chose: #{computer_choice}")

  display_results?(choice.to_sym, computer_choice)

  if win?(choice.to_sym, computer_choice)
    scoreboard[:wins] += 1
  elsif win?(computer_choice.to_sym, choice)
    scoreboard[:loss] += 1
  else
    scoreboard[:tie] += 1
  end

  prompt("SCOREBOARD: Wins= #{scoreboard[:wins]}
          loss= #{scoreboard[:loss]}
          Ties= #{scoreboard[:tie]}")
  prompt('Play Again?')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt('thanks for playing!')
