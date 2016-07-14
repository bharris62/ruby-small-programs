USER_CHOICE = %w(rock=r paper=p scissors=s lizard=l spock=sp)
VALID_CHOICES = %w(r p s l sp)

def choice_val(play)
  case play
  when 'r' then 0
  when 'p' then 1
  when 's' then 2
  when 'l' then 3
  when 'sp' then 4
  end
end

def calc_winner(a, b)
  (5 + a - b) % 5
end

def display_results(win)
  if win == 1 || win == 2
    prompt('You Win!')
  elsif win == 3 || win == 4
    prompt('Computer Wins!')
  elsif win == 0
    prompt('it is a draw!')
  else
    prompt('contact support, something went wrong!')
  end
end

def prompt(message)
  puts("=> #{message}")
end

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

  user_score = choice_val(choice).to_i
  computer_score = choice_val(computer_choice).to_i

  prompt("You chose: #{choice} | Computer chose: #{computer_choice}")

  winner = calc_winner(user_score, computer_score)
  display_results(winner)

  prompt('Play Again? ')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt('thanks for playing!')
